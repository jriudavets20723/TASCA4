use MER6;
SELECT PASSATGER.DNI, PASSATGER.nom, PASSATGER.cognom, VOL.num_vol, VOL.origen, VOL.desti, RESERVA.import
FROM PASSATGER, VOL, RESERVA
WHERE PASSATGER.ID = RESERVA.PASSATGER_ID and
	VOL.ID = RESERVA.VOL_ID;