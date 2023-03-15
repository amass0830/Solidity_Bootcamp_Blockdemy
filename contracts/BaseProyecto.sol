// SPDX-License-Identifier: GPL-3.0
import "hardhat/console.sol";
pragma solidity ^0.8.0;

contract BaseProyecto {
    struct Proposal2 {
        address addressProposal;
        uint voteCount; // Contador de votos
    }
    struct Voter1 {
        address addressVotante;
        bool authVotante; // Autorizador de votante
    }
    address owner;
    Voter1[] public arrVoters;
    Proposal2[] public arrProposals;

    constructor() {
        console.log("Owner contract deployed by:", msg.sender);
        owner = msg.sender;
    }

    function addVoto(address _addrV, address _addrP) public {
        //Para avanzar en la votación, los votantes del array deben estar autorizados
        require(arrVoters[0].authVotante == true);
        require(arrVoters[1].authVotante == true);
        if (_addrP == arrProposals[0].addressProposal) {
            arrProposals[0].voteCount++;
            arrVoters[0].authVotante = false;
        } else arrProposals[1].voteCount++;
        arrVoters[1].authVotante = false;
    }

    function authVotante(address _addrOwner, address _addrV) public {
        if (_addrOwner == owner) {
            if (_addrV == arrVoters[0].addressVotante) {
                arrVoters[0].authVotante = true;
            } else arrVoters[1].authVotante = true;
            console.log("Address votante autorizado");
        }
    }

    function addProposal(address _addr, uint _c) public {
        arrProposals.push(Proposal2(_addr, _c));
    }

    function addVotante(address _addrV, bool _auth) public {
        arrVoters.push(Voter1(_addrV, _auth));
    }

    function viewGanador() public view returns (address, address) {
        while (
            arrProposals[0].voteCount != 0 && arrProposals[0].voteCount != 0
        ) {
            if (arrProposals[0].voteCount > arrProposals[1].voteCount) {
                console.log("Ganador", arrProposals[0].addressProposal);
                return (arrProposals[0].addressProposal, owner);
            }
            if (arrProposals[0].voteCount == arrProposals[1].voteCount) {
                console.log("Se encuentra igualdad en cantidad de votos");
                return (
                    arrProposals[0].addressProposal,
                    arrProposals[1].addressProposal
                );
            } else console.log("Ganador", arrProposals[1].addressProposal);
            return (arrProposals[1].addressProposal, owner);
        }
        console.log("No se registraron votos");
    }

    function viewVotoProposal() public view returns (uint, uint) {
        return (arrProposals[0].voteCount, arrProposals[1].voteCount);
    }

    function viewVotante() public view returns (bool, address, bool, address) {
        return (
            arrVoters[0].authVotante,
            arrVoters[0].addressVotante,
            arrVoters[1].authVotante,
            arrVoters[1].addressVotante
        );
    }

    function getOwner() external view returns (address) {
        return owner;
    }
}
