DELIMITER //
CREATE PROCEDURE add_habxhotel (hotel_cod INT(11), cat_hab INT(11), precio int (11), cant int(11), n_adi int(11), descrp varchar(30))
BEGIN 

DECLARE v1 INT DEFAULT 0;
DECLARE number_found INT DEFAULT 0;

INSERT INTO habitacion_hotel (Hotel_cod, catalogo_habitacion_cod_ch, precio_dia, cantidad, NroAdicionales, descripcion)
VALUES (hotel_cod, cat_hab, precio, cant, n_adi, descrp);

  SELECT n_hab INTO number_found
  FROM  hotel
  WHERE cod_hotel = hotel_cod;

  WHILE v1 < cant DO
    SET number_found = number_found+1;
    SET v1 = v1+1;
    
    INSERT INTO habitacion (cod_hotel, cod_CH, nPuerta)
    VALUES (hotel_cod, cat_hab, number_found);
    
  END WHILE;

   UPDATE hotel
   SET n_hab=number_found
   WHERE cod_hotel=hotel_cod;


END //
DELIMITER ;
