Feature: Edit

Proceso de realizar Testing BDD en Editar Cliente con datos válidos e inválidos

@tag1
Scenario: Editar Cliente con datos válidos
    Given Existe un cliente registrado en la BDD para edicion
        | Cedula     | Apellidos      | Nombres       | FechaNacimiento | Mail                  | Telefono  | Direccion | Estado |
        | 1722046412 | Castillo | Angel| 06/05/1998      | agcastillo2@gmail.com | 969048289 | Quito     | 1      |
    When Modifico los datos del cliente en el formulario con datos válidos
        | Cedula     | Apellidos      | Nombres       | FechaNacimiento | Mail                  | Telefono  | Direccion | Estado |
        | 1722046412 | Castillo | Angel | 06/05/1998      | agcastillo2@gmail.com | 969048289 | Guayaquil | 1      |
    Then El resultado de la actualización en la BDD debe ser
        | Cedula     | Apellidos      | Nombres       | FechaNacimiento | Mail                  | Telefono  | Direccion | Estado |
        | 1722046412 | Castillo | Angel | 06/05/1998      | agcastillo2@gmail.com | 969048289 | Guayaquil | 1      |

@tag1
Scenario: Editar Cliente con datos inválidos (Cédula vacía)
    Given Existe un cliente registrado en la BDD para edicion
        | Cedula     | Apellidos      | Nombres       | FechaNacimiento | Mail                  | Telefono  | Direccion | Estado |
        | 1722046412 | Castillo | Angel | 06/05/1998      | agcastillo2@gmail.com | 969048289 | Quito     | 1      |
    When Modifico los datos del cliente en el formulario con datos inválidos
        | Cedula | Apellidos      | Nombres       | FechaNacimiento | Mail                  | Telefono  | Direccion | Estado |
        |        | Castillo | Angel | 06/05/1998      | agcastillo2@gmail.com | 969048289 | Guayaquil | 1      |
    Then Debe mostrar un mensaje de error indicando que la cédula es requerida

@tag1
Scenario: Editar Cliente con datos inválidos (Correo inválido)
    Given Existe un cliente registrado en la BDD para edicion
        | Cedula     | Apellidos      | Nombres       | FechaNacimiento | Mail                  | Telefono  | Direccion | Estado |
        | 1722046412 | Castillo | Angel | 06/05/1998      | agcastillo2@gmail.com | 969048289 | Quito     | 1      |
    When Modifico los datos del cliente en el formulario con datos inválidos
        | Cedula     | Apellidos      | Nombres       | FechaNacimiento | Mail          | Telefono  | Direccion | Estado |
        | 1722046412 | Castillo | Angel | 06/05/1998      | correoinvalido | 969048289 | Guayaquil | 1      |
    Then Debe mostrar un mensaje de error indicando que el correo es inválido