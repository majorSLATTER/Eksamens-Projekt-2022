from graphics import *

# Vinduets størrelse. 
windowSize = [1920, 1080]

# Variable for standard data dokumenter
PathData = R"Data.txt"
ImageData = R"test.png"
InfoData = R"Info.txt"
InstanceData = 1

# Funktion der kan justere tekst i graphics
def setJustify(self, option):
    if not option in ["left", "center", "right"]:
        raise GraphicsError(BAD_OPTION)
    self._reconfig("justify", option)

# Funktion til at tjekke om der er trykket inde i en rektangel
def inside(point, rect):
    ul = rect.getP1() # finder punktet for ul (upper left)
    lr = rect.getP2() # finder punktet for lr (lower right)

    return ul.getX() < point.getX() < lr.getX() and ul.getY() < point.getY() < lr.getY()

# Main loop
def main():
    
    # Vinduet der bliver skabt
    win = GraphWin ("PIM", windowSize[0], windowSize[1])
    
    # Main interface
    def SideBar():
        SideBar = Rectangle(Point(-1,-1),Point(100,1080))
        SideBar.setFill("#D6E5F3")
        SideBar.setOutline("#D6E5F3")
        SideBar.draw(win)
    
    # Baggrund og infoboks er lavet af 2 rectangels med 2 cirkler i der kanter for at få en rund kant
    def InfoBackground():
        PBGRect1 = Rectangle(Point(150, 50), Point(1870, 1030))
        PBGRect2 = Rectangle(Point(175, 25), Point(1845, 1055))
        PBGCirc1 = Circle(Point(175, 50), 25)
        PBGCirc2 = Circle(Point(1845, 50), 25)
        PBGCirc3 = Circle(Point(175, 1030), 25)
        PBGCirc4 = Circle(Point(1845, 1030), 25)
        Samlet = [PBGRect1, PBGRect2, PBGCirc1, PBGCirc2, PBGCirc3, PBGCirc4]
        for x in Samlet:
            x.setFill("#E4E4E4")
            x.setOutline("#E4E4E4")
            x.draw(win)

    def InfoBoks():
        PBGRect1 = Rectangle(Point(200, 250), Point(1180, 1030))
        PBGRect2 = Rectangle(Point(175, 275), Point(1205, 1005))
        PBGCirc1 = Circle(Point(200, 275), 25)
        PBGCirc2 = Circle(Point(1180, 1005), 25)
        PBGCirc3 = Circle(Point(200, 1005), 25)
        PBGCirc4 = Circle(Point(1180, 275), 25)
        Samlet = [PBGRect1, PBGRect2, PBGCirc1, PBGCirc2, PBGCirc3, PBGCirc4]
        for x in Samlet:
            x.setFill("#F2F2F2")
            x.setOutline("#F2F2F2")
            x.draw(win)
        Line(Point(200, 335), Point(1180, 335)).draw(win)
           
        # Header linje "Information"
        Headline = Text(Point(485, 310), "Information om produkt")
        Headline.setSize(35)
        Headline.setStyle("bold")
        Headline.draw(win)
        
        # "forløb" tekst og bar
        ProgressTxt = Text(Point(260, 360), "Forløb")
        ProgressTxt.setSize(20)
        ProgressTxt.draw(win)
        Progressbar = Rectangle(Point(200, 385), Point(1180, 430))
        Progressbar.setFill("#D9D9D9")
        Progressbar.setOutline("#D9D9D9")
        Progressbar.draw(win)

        # Info tekst eg: stadie mm.
        InfoX = 375
        InfoY = 775
        InfoText = open(InfoData, "r")
        fullInfo = ""
        for line in InfoText:
            fullInfo += line + "\n"
        r = Text(Point(InfoX, InfoY), fullInfo)
        setJustify(r, "right")
        r.setSize(27)
        r.setStyle("bold")
        r.setTextColor("#616161")
        r.draw(win)
        InfoText.close()
    
    # Billedet af produktet
    # Ikke brugerdefineret
    def Billede():
        imagePlace = Image(Point(1550, 500), ImageData)
        imagePlace.draw(win)

    # De kasser med entries
    InsertY = 473 # InsertY er blot en standard Y værdi for alle entry kasserne

    # Alle entry kasser
    # En alternativ måde at lave dem kunne være med en class
    Varenummer = Entry(Point(850, InsertY), 30)
    Stadie = Entry(Point(850, InsertY + 86), 30)
    Masse = Entry(Point(850, InsertY + 86*2), 30)
    Kategori = Entry(Point(850, InsertY+ 86*3), 30)
    Enheder = Entry(Point(850, InsertY+ 86*4), 30)
    Materiale = Entry(Point(850, InsertY+ 86*5), 30)
    Farve = Entry(Point(850, InsertY+ 86*6), 30)
    ProduktNavn = Entry(Point(650, 150), 30)
    
    # En måde at samle alle værdier fra entry kasserne i en liste
    SamletInfo = [Varenummer, Stadie, Masse, Kategori, Enheder, Materiale, Farve, ProduktNavn]

    # Funktion der tegner entry kasserne og indsætter data i dem 
    def InsertInfo():
        global InstanceData, PathData
        
        # Dette stykke åbner data filen, læser de givne data og indsætter dem i listen PredBuildInfo
        try:
            o = open(PathData)
        except:
            o = open(PathData, "x")
            o.close()
            o = open(PathData)
        PreBuiltText = o.readlines()
        try:
            PreBuildInfo = PreBuiltText[InstanceData-1].split(";")
            PreBuildInfo.pop(-1)
        except:
            PreBuildInfo = []
        
        o.close()

        # Dette stykke indsætter dataen i entry kasserne og tegner dem i vinduet
        y = 0
        try:
            for x in SamletInfo:
                x.setText(PreBuildInfo[y])
                y += 1
                x.setFill("#D9D9D9")
                x.setSize(27)
                x.undraw()
                x.draw(win)
        except:
            for x in SamletInfo:
                x.setText("")
                y += 1
                x.setFill("#D9D9D9")
                x.setSize(27)
                x.undraw()
                x.draw(win)
        
        # Selve produkt navnet er anderledes fra de andre entry kasser, derfor bliver den gen-tegnet med sine egne specifikationer
        ProduktNavn.undraw()
        ProduktNavn.setFill("#E4E4E4")
        ProduktNavn.setSize(36)
        ProduktNavn.draw(win)

        
    # Koordinater for gem knappen og nyt produkt knappen
    GemButton = [1560, 989]
    NPButton = [50, 50]
    
    # Specifikationer for nyt produkt knap
    NytProduktKnap = Rectangle(Point(NPButton[0]-40, NPButton[1]-40), Point(NPButton[0]+40, NPButton[1]+40))
    NytProduktKnap.setFill("#5F85A9")
    NytProduktTXT = Text(NytProduktKnap.getCenter(),"Nyt\nProdukt")

    # Specifikation for gem knap
    # Denne kunne godt have mere design til sig
    GemKnap = Rectangle(Point(GemButton[0]-50, GemButton[1]-22), Point(GemButton[0]+50, GemButton[1]+22))
    GemKnapTXT = Text(Point(GemButton[0], GemButton[1]), "Gem")

    # Funktion til at loade ny data, ved indsætning af path til data fil og hvilken instance det skal være
    def NytProdukt():
        global PathData, InstanceData, clickPoint
        NytWin = GraphWin("Nyt Produkt", 400, 250)
        Text(Point(100,80), "Indsæt path til data:").draw(NytWin)
        Text(Point(100,170), "Indsæt linjenummer:").draw(NytWin)
        Path = Entry(Point(300, 80), 20).draw(NytWin)
        Instance = Entry(Point(300, 170), 20).draw(NytWin)
        
        GemKnap = Rectangle(Point(150, 210), Point(250, 240))
        Text(GemKnap.getCenter(),"Gem").draw(NytWin)
        GemKnap.draw(NytWin)
        
        # Logik til hvis man trykker på gem knappen
        while not NytWin.isClosed():
            clickPoint = NytWin.checkMouse()
            if clickPoint is None:
                pass   
            elif inside(clickPoint, GemKnap):
                PathData = Path.getText().replace("\"", "")
                InstanceData = int(Instance.getText())
                InsertInfo()
                NytWin.close()

    # Tegnelser for alle elementer
    SideBar()
    InfoBackground()
    InfoBoks()
    GemKnap.draw(win)
    GemKnapTXT.draw(win)
    InsertInfo()
    Billede()
    NytProduktKnap.draw(win)
    NytProduktTXT.draw(win)
    
    # Logik for knapper på vinduet
    while not win.isClosed():
        clickPoint = win.checkMouse()
        if clickPoint is None:
            pass      
        elif inside(clickPoint, Rectangle(Point(GemButton[0]-50, GemButton[1]-22), Point(GemButton[0]+50, GemButton[1]+22)).draw(win)):
            AlleInfo = [Varenummer, Stadie, Masse, Kategori, Enheder, Materiale, Farve, ProduktNavn]
            DataFile = open(PathData, "a")
            DataFile.write("\n")
            for x in AlleInfo:
                DataFile.write(x.getText() + ";")
            DataFile.close()
        elif inside(clickPoint, Rectangle(Point(NPButton[0]-40, NPButton[1]-40), Point(NPButton[0]+40, NPButton[1]+40))):
            NytProdukt()


            
    win.getMouse() # Pause to view result
    print(win.getMouse(), win.checkKey())
    win.close()    # Close window when done
main()

# < >
