from graphics import *

windowSize = [1920, 1080]

# Tyv-stjålet kode fra stackoverflow der gør det muligt at justere tekst
def setJustify(self, option):
    if not option in ["left", "center", "right"]:
        raise GraphicsError(BAD_OPTION)
    self._reconfig("justify", option)

def main():
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
        InfoText = open("Info.txt", "r")
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
    
    # De kasser med entries
    InsertY = 473
    
    # Funktion til at tjekke om der er trykket inde i en rektangel
    def inside(point, rect):
        ul = rect.getP1() # finder punktet for ul (upper left)
        lr = rect.getP2() # finder punktet for lr (lower right)

        return ul.getX() < point.getX() < lr.getX() and ul.getY() < point.getY() < lr.getY()
    
    def AddButton(x, y):
        r = Rectangle(Point(x-22, y-22), Point(x+21, y+21)).draw(win)
        Line(Point(x+18, y), Point(x-19, y)).draw(win)
        Line(Point(x, y+18), Point(x, y-19)).draw(win)

    o = open("Data.txt", "r")
    PreBuildInfo = o.read().split(";")
    o.close()

    y=0
    Stadie = Entry(Point(850, InsertY), 30)
    Varenummer = Entry(Point(850, InsertY + 86), 30)
    Masse = Entry(Point(850, InsertY + 86*2), 30)
    Kategori = Entry(Point(850, InsertY+ 86*3), 30)
    Enheder = Entry(Point(850, InsertY+ 86*4), 30)
    SamletInfo = [Stadie, Varenummer, Masse, Kategori, Enheder]
    for x in SamletInfo:
        y += 1
        x.setText(PreBuildInfo[y])
        x.setFill("#D9D9D9")
        x.setSize(27)
        x.draw(win)


    ProduktNavn = Entry(Point(650, 150), 30)
    ProduktNavn.setText(PreBuildInfo[0])
    ProduktNavn.setFill("#E4E4E4")
    ProduktNavn.setSize(36)
    ProduktNavn.draw(win)

    MatBoks1 = Entry(Point(610, 903), 6)
    MatBoks1.setFill("#D9D9D9")
    MatBoks1.setSize(27)
    MatBoks1.draw(win)
    MatBoks2 = Entry(Point(740, 903), 6)
    MatBoks2.setFill("#D9D9D9")
    MatBoks2.setSize(27)
    MatBoks3 = Entry(Point(870, 903), 6)
    MatBoks3.setFill("#D9D9D9")
    MatBoks3.setSize(27)
    
    FarveBoks1 = Entry(Point(610, 989), 6)
    FarveBoks1.setFill("#D9D9D9")
    FarveBoks1.setSize(27)
    FarveBoks1.draw(win)
    FarveBoks2 = Entry(Point(740, 989), 6)
    FarveBoks2.setFill("#D9D9D9")
    FarveBoks2.setSize(27)
    FarveBoks3 = Entry(Point(870, 989), 6)
    FarveBoks3.setFill("#D9D9D9")
    FarveBoks3.setSize(27)

    MatButton = [720, 903]
    FarvButton = [720, 989]
    GemButton = [1560, 989]
    
    # Tegnelser for alle elementer
    SideBar()
    InfoBackground()
    InfoBoks()
    AddButton(MatButton[0], MatButton[1])
    AddButton(FarvButton[0], FarvButton[1])
    AddButton(GemButton[0], GemButton[1])

    # Logik for knapper
    temp1 = 1
    temp2 = 1
    while temp1 < 3 or temp2 < 3:    
        clickPoint = win.checkMouse()
        if clickPoint is None:
            pass
        elif inside(clickPoint, Rectangle(Point(MatButton[0]-22, MatButton[1]-22), Point(MatButton[0]+22, MatButton[1]+22)).draw(win)):
            temp1 +=1
            MatButton[0] += 130
            AddButton(MatButton[0], MatButton[1])
            if temp1 == 2:
                MatBoks2.draw(win)
            elif temp1 == 3:
                MatBoks3.draw(win)
            
        elif inside(clickPoint, Rectangle(Point(FarvButton[0]-22, FarvButton[1]-22), Point(FarvButton[0]+22, FarvButton[1]+22)).draw(win)):
            temp2 +=1
            FarvButton[0] += 130
            AddButton(FarvButton[0], FarvButton[1])
            if temp2 == 2:
                FarveBoks2.draw(win)
            elif temp2 == 3:
                FarveBoks3.draw(win)
        
        elif inside(clickPoint, Rectangle(Point(GemButton[0]-22, GemButton[1]-22), Point(GemButton[0]+22, GemButton[1]+22)).draw(win)):
            AlleInfo = [ProduktNavn, Stadie, Varenummer, Masse, Kategori, Enheder]
            DataFile = open("Data.txt", "w")
            for x in AlleInfo:
                DataFile.write(x.getText() + ";")
            DataFile.close()
        

            
    win.getMouse() # Pause to view result
    print(win.getMouse(), win.checkMouse())
    win.close()    # Close window when done
main()

# < >