// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract VisibilidadFunciones {
    //*** Programa de Recompensas

    //variables de estado
    int puntosTotales;
    int puntosEntrada;

    function asignarPuntos(int _p1) private {
        puntosEntrada = _p1;
    }

    function sumarPuntos(int _p1) internal {
        asignarPuntos(_p1);
        puntosTotales = puntosTotales + puntosEntrada;
    }

    function verPuntos() public returns (int) {
        //this.verOwner();
        sumarPuntos(10);
        return puntosTotales;
    }

    address public sender = msg.sender;

    uint public blockNumber = block.number;

    uint public txPrice = tx.gasprice;

    //External - Se llaman expliciatemente y desde otros contratos
    function verVarGlobales() external {
        sender = msg.sender;

        blockNumber = block.number;
    }
}

//Herencias(Funct.)
contract EjemploPrograma is VisibilidadFunciones {
    address owner;

    function fun(int _p1) public {
        sumarPuntos(_p1);
        verPuntos();
    }

    constructor() {
        owner = msg.sender;
    }
}
