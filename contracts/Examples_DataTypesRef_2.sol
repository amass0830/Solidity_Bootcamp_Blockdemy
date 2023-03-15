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
    Person person1 = Person("Andrea", 21, true);

    Person person2 = Person("Lucia", 28, true);

    //obtener la edad o alguno de los valores del struct
    string public namePerson = person1.name;
    int public agePerson = person1.age;

    //mappin - tablas hash o didcionario
    //Asocia una clave y un valor
    //{clave, valor} Eje-> {Número, fruta} = {1,manzana}, {2,pera},{3,durazno}
    //Si consulto la clave me va a otorgar el valor

    mapping(int => string) public fruits;

    //con esto declaramos el mapping, solo hemos hecho el tipo de dato

    //Vamos a agregar valores la mapping, pero para esto es necesario crear una función. En las funciones siempre hay que poner public
    //Solo creamos la funcion, pero no la hemos mandado llamar
    //Para el deplo, primero hacer click en addFruta y despues en frutas poner clave 1
    function addFruit() public {
        fruits[1] = "apple";
        fruits[200] = "pear";
    }

    //no tiene que ser consecutivo como el array
    /* Los mapping se utilizan mucho para asociar el adrres al saldo o balances*/
    mapping(address => int) balances;

    function addBalance() public {
        fruits[1] = "100";
        fruits[200] = "p50";
    }

    //mapping que asocie la persona con una dirección
    mapping(address => Person) mappingpersona;

    //Arrays - deben de ser consecutivos y siempre inician en 0
    //En los mapping puede ser cualquier dato la clave
    //una colección de valores del mismo tipo de dato Ej: frutas
    // [manzana, pera,durazno]

    //arrays dinámicos porque no definimos el # de datos de cada array
    string[] public arrFruits;
    Person[] public arrPersons;
    int[] public arrNumeros;

    //array fijo
    //int[3] public arrNumeros;

    function addArrayPersonas() public {
        arrPersons.push(person1);
    }

    function addArrayFrutas() public {
        arrFruits.push("Pera");
        arrFruits.push("Durazno");
        arrFruits.push("Fresa");
    }

    function addArrayFrutasAuto(string memory _frutaNueva) public {
        arrFruits.push(_frutaNueva);
    }

    //Para consultar arrays primero le ponemos en ADd y luego "0" al ser un arrgelo y consultarlo

    function addArrayNumeros() public {
        arrNumeros.push(1);
    }
}
