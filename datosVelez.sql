-- Datos catálogo localidad:
INSERT INTO `localidad` (`cp`, `Localidad`, `Provincia`) VALUES ('14140', 'La Victoria', 'Córdoba');
INSERT INTO `localidad` (`cp`, `Localidad`, `Provincia`) VALUES ('41400', 'Ecija', 'Sevilla');
INSERT INTO `localidad` (`cp`, `Localidad`, `Provincia`) VALUES ('41560', 'Estepa', 'Sevilla');
INSERT INTO `localidad` (`cp`, `Localidad`, `Provincia`) VALUES ('41640', 'Osuna', 'Sevilla');
INSERT INTO `localidad` (`cp`, `Localidad`, `Provincia`) VALUES ('41630', 'Lantejuela', 'Sevilla');

-- Datos catálogo ciclos:
INSERT INTO `ciclos` (`idCiclo`, `nombre`) VALUES ('DAW', 'Desarrollo de Aplicaciones Web');
INSERT INTO `ciclos` (`idCiclo`, `nombre`) VALUES ('DAM', 'Desarrollo de Aplicaciones Multiplataforma');
INSERT INTO `ciclos` (`idCiclo`, `nombre`) VALUES ('ASIR', 'Administración Sistemas Informáticos en Red');
INSERT INTO `ciclos` (`idCiclo`, `nombre`) VALUES ('SMR', 'Sistemas Microinformáticos en Red');

-- Datos de asignaturas disponibles para la matrícula.
INSERT INTO `asignatura` (`idAsignatura`, `nombreAsignatura`, `curso`, `idCiclo`) VALUES ('1', 'Lenguajes de Marcas', 'primero', 'DAW');
INSERT INTO `asignatura` (`idAsignatura`, `nombreAsignatura`, `curso`, `idCiclo`) VALUES ('2', 'Redes', 'primero', 'ASIR');
INSERT INTO `asignatura` (`idAsignatura`, `nombreAsignatura`, `curso`, `idCiclo`) VALUES ('3', 'IMWEB', 'segundo', 'ASIR');
INSERT INTO `asignatura` (`idAsignatura`, `nombreAsignatura`, `curso`, `idCiclo`) VALUES ('4', 'ADSGB', 'segundo', 'ASIR');

-- Datos de alumnos
INSERT INTO `alumno` (`idAlumno`, `nombre`, `apellido1`, `apellido2`, `fecNacimiento`, `sexo`, `correo`, `nacionalidad`, `cp`, `direccion`) VALUES ('11111111A', 'Jose', 'Suarez', 'Ruiz', '1990/05/12', 'm', 'jsuru@g.es', 'española', '14140', 'avd la paz 2');
INSERT INTO `alumno` (`idAlumno`, `nombre`, `apellido1`, `apellido2`, `fecNacimiento`, `sexo`, `correo`, `nacionalidad`, `cp`, `direccion`) VALUES ('22222222B', 'Ana', 'Perez', 'Jimenez', '1990/12/05', 'f', 'apeji@kk.es', 'española', '41400', 'avd genil 1');

-- Datos de alumnos
INSERT INTO `alumno_asignatura` (`idAlumno`, idAsignatura) VALUES ('11111111A', '2');
INSERT INTO `alumno_asignatura` (`idAlumno`, idAsignatura) VALUES ('11111111A', '3');
INSERT INTO `alumno_asignatura` (`idAlumno`, idAsignatura) VALUES ('11111111A', '4');

INSERT INTO `alumno_asignatura` (`idAlumno`, idAsignatura) VALUES ('22222222B', '2');
INSERT INTO `alumno_asignatura` (`idAlumno`, idAsignatura) VALUES ('22222222B', '3');
INSERT INTO `alumno_asignatura` (`idAlumno`, idAsignatura) VALUES ('22222222B', '4');

-- Datos login_users
INSERT INTO `velez`.`login_users` (`usuario`, `passwd`) VALUES ('admin', 'admin');
