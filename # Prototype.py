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
    
    # Den kasser med entries
    def InsertBoks():
        InsertY = 473
        for x in range(5):
            x = Entry(Point(850, InsertY), 30)
            x.setFill("#D9D9D9")
            x.setSize(27)
            x.draw(win)
            InsertY += 86
    
    # Funktion til at tjekke om der er trykket inde i en rektangel
    def inside(point, rect):
        ul = rect.getP1() # finder punktet for ul (upper left)
        lr = rect.getP2() # finder punktet for lr (lower right)

        return ul.getX() < point.getX() < lr.getX() and ul.getY() < point.getY() < lr.getY()
    
    def AddButton(x, y):
        r = Rectangle(Point(x-22, y-22), Point(x+21, y+21)).draw(win)
        Line(Point(x+18, y), Point(x-19, y)).draw(win)
        Line(Point(x, y+18), Point(x, y-19)).draw(win)
        
    
    def MaterialBoks(x, y):
        MatBoks = Entry(Point(x, y), 6)
        MatBoks.setFill("#D9D9D9")
        MatBoks.setSize(27)
        MatBoks.draw(win)
    
    
    MatButton = [720, 903]
    FarvButton = [720, 989]
    
    
    # Tegnelser for alle elementer
    SideBar()
    InfoBackground()
    InfoBoks()
    InsertBoks()
    AddButton(MatButton[0], MatButton[1])
    AddButton(FarvButton[0], FarvButton[1])
    MaterialBoks(MatButton[0]-110, MatButton[1])
    MaterialBoks(FarvButton[0]-110, FarvButton[1])

    # Logik for knapper
    temp1 = 0
    temp2 = 0
    while temp1 < 3 and temp2 < 3:    
        clickPoint = win.checkMouse()
        if clickPoint is None:
            pass
        elif inside(clickPoint, Rectangle(Point(MatButton[0]-22, MatButton[1]-22), Point(MatButton[0]+22, MatButton[1]+22)).draw(win)):
            MatButton[0] += 130
            AddButton(MatButton[0], MatButton[1])
            MaterialBoks(MatButton[0]-110, MatButton[1])
            temp1 +=1
        elif inside(clickPoint, Rectangle(Point(FarvButton[0]-22, FarvButton[1]-22), Point(FarvButton[0]+22, FarvButton[1]+22)).draw(win)):
            FarvButton[0] += 130
            AddButton(FarvButton[0], FarvButton[1])
            MaterialBoks(FarvButton[0]-110, FarvButton[1])
            temp2 +=1
    win.getMouse() # Pause to view result
    print(win.getMouse(), win.checkMouse())
    win.close()    # Close window when done
main()

# < >