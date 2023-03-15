//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract sistema_de_votos {

    //Estas variables son para los candidatos
    struct Candidato {
        string nombre;
        string puestoTrabajo;
        string nacionalidad;
        address direccion_de_candidato;
    }

    //Variables Globales
    address owner;
    uint8 totalVotantes;
    uint ganadorUnico;

    //Mapping para almacenaje de candidatos y sus votos
    mapping (uint256 => Candidato) public candidatos;
    mapping (address => uint8) public votosPorCandidato;

    // Mapping para el registro de los votantes (usando su address para que no se generen dobles votos por votante) y   que  esta se pueda almacenar
    mapping (address => bool) public permisoDeVotacion;


    // Constructor para establecer el dueño del contrato (como el único que hara deploy) y el número de votos límite
    constructor(Candidato[] memory infoCandidatos) public {
        owner = msg.sender;
        for (uint256 i = 0; i < infoCandidatos.length; i++) {
            candidatos[i] = infoCandidatos[i];
        }
    }
    
    // Agregar a un candidato
    function addCandidato (
        string memory nombre, 
        string memory puesto_trabajo, 
        string memory nacionalidad, 
        address direccion_de_candidato
        ) public 
    {
    uint256 numCandidatos = 0;
    for (uint256 i = 0; i < 2**256 - 1; i++) {
        if (candidatos[i].nombre != "") {
            numCandidatos++;
        } else {
            break;
        }
    }
    candidatos[numCandidatos].nombre = nombre;
    candidatos[numCandidatos].puestoTrabajo = puesto_trabajo;
    candidatos[numCandidatos].nacionalidad = nacionalidad;
    candidatos[numCandidatos].direccion_de_candidato = direccion_de_candidato;


    // Inscribir votantes unicamente por medio del owner (según criterios establecidos)
    function inscribirVotante(address votante) public {
        require(msg.sender == owner, "Solo el propietario puede inscribir votantes");
        permisoDeVotacion[votante] = true;
        totalVotantes += 1;
    }

    // Función para votar por un candidato
// Función para votar por un candidato
    function votar(address direccion_de_candidato) public {
        require(permisoDeVotacion[msg.sender] == true);
        votosPorCandidato[direccion_de_candidato] += 1;

        // Verifica si algún candidato ha ganado la elección
        if (votosPorCandidato[direccion_de_candidato] > totalVotos() / 2) {
            emit ganadorUnico(direccion_de_candidato);
        }
    }


    // revision el número total de votos
    function totalVotos() public view returns (uint256) {
        uint256 total = 0;
        address[] memory direccion_de_candidato = candidatos.keys();
        for (uint i = 0; i < direccion_de_candidato.length; i++) {
            address direccion_candidato = direccion_de_candidato[i];
            total += votosPorCandidato[direccion_de_candidato];
        }
        return total;
    }
    // declaración de evento (like alert) para colocar al ganador con su direccion
    event unico_ganador(address candidato_address);
    }
}