// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Funciones {
    int operador1;
    int operador2;
    int resultado;

    function RecibirDatos(int _parametro1, int _parametro2) public {
        operador1 = _parametro1;
        operador2 = _parametro2;
    }

    function sumar() public {
        resultado = operador1 + operador2;
    }

    function verResultado() public view returns (int) {
        return resultado;
    }
}
