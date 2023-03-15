// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7 < 0.8.;
// tambien se puede escribir pragma solidity ^0.8.0

//Recomendación, poner el mismo nombre del archivo o carpeta 
contract DataTypesReference {
    //Struct
    struct Person {
        string name;
        int age;
        bool active;
    }

    //crear el dato 
    Persona person1 = Person ("Andrea",21,true);

    Persona person2 = Person("Lucia",28,true);

    //obtener la edad o alguno de los valores del struct
    string public namePerson = person1.name;
    int public agePerson = person1.age;

    string public namePerson = person2.name;
    int public agePerson = person2.age;

}