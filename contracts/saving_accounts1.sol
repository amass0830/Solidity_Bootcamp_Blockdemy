// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Ahorro {
    //Struct
    /*   struct  Persona{
        string nombre;
        uint edad;   
        uint amount;
        address addr; 
    }*/

    string nombre;
    uint edad;
    int private saldo;
    address addr;

    //Guardar mi nombre, edad, saldo
    function addNombre(string memory _n) public {
        nombre = _n;
    }

    function addEdad(uint _e) public {
        edad = _e;
    }

    //AgregarSaldo
    function addSaldo(int _s) public {
        saldo = saldo + _s;
    }

    //Guarde mi address
    function addAddr(address _addr) public {
        addr = _addr;
    }

    //QuitarSaldo
    function remSaldo(int _sa) public {
        saldo = saldo - _sa;
    }

    //VerSaldo
    function viewAll()
        public
        view
        returns (string memory _n, uint _e, int _s, address _ad)
    {
        return (nombre, edad, saldo, addr);
    }
}
