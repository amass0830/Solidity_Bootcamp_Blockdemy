// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract Loan_sm {
    // Datos del usuario
    struct User {
        string name;
        uint256 loanAmount;
        uint256 interestRate;
        uint256 repaymentPeriod;
        uint256 startDate;
        uint256 endDate;
        uint256 balance;
    }

    // Registro de usuarios
    mapping(address => User) public users;

    // Función para solicitar un préstamo
    function applyForLoan() public {
        // Cálculo de la fecha de finalización del préstamo
    }

    // Creación de una nueva estructura de usuario

    // Almacenamiento del usuario en el registro
    // Función para realizar un pago
    // Aqui debería de ir importado lo del interes nominal, solo que no sé como hacerlo
    // Actualización del saldo del usuario
    // ver la actualización del saldo del usuario para qeu se refleje el pago que hizo el prestario para el solicitante
    // Función para verificar el estado del préstamo
    // esta funcion seria como para ver como va el solicitante con sus pagos
    // (STANDBY)
}
