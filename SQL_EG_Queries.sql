use egpim;

SELECT 
    produkt.Navn,
    produkt.Vægt,
    pimstatus.StatusNavn,
    kategori.KatergoriNavn
FROM
    produkt
        JOIN
    pimstatus ON produkt.StatusID = pimstatus.StatusID
        JOIN
    kategori ON produkt.KategoriID = kategori.KategoriID;

SELECT 
    produkt.Navn, farve.FarveNavn
FROM
    produkt_farve
        JOIN
    produkt ON produkt.ProduktID = produkt_farve.Produkt_ProduktID
        JOIN
    farve ON farve.FarveID = produkt_farve.Farve_FarveID
HAVING produkt.Navn = 'Glizzy Shirt';

SELECT 
    produkt.Navn, materiale.materialeNavn, Antal, Enhed
FROM
    produkt_materiale
        JOIN
    produkt ON produkt_materiale.Produkt_ProduktID = produkt.ProduktID
        JOIN
    materiale ON materiale.MaterialeID = produkt_materiale.Materiale_MaterialeID;