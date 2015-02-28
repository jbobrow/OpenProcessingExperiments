
int gridsize = 20;
int cont = 30;
String chrlist = "abcdefghijklmnopqrstuvwxyz0123456789";
ArrayList symbolhead = new ArrayList();

void setup() {
    //size(screen.width, screen.height, P2D);
    size(500, 500, P2D);
    background(0);
    textFont(loadFont("MatrixCodeNFI-16.vlw"), 22);

    SymbolHead letra = new SymbolHead((int) random(width/gridsize), -1); //width/gridsize/2, height/gridsize/4); //(int) random(width), (int) random(height));
    symbolhead.add(letra);
}

void draw() {
    //background(0);
    fill(0, 0, 0, 50);
    rect(0, 0, width, height);

    if ((int) random(0, cont) == 0) {
        SymbolHead letra = new SymbolHead((int) random(width/gridsize), -1); //width/gridsize/2, height/gridsize/4); //(int) random(width), (int) random(height));
        symbolhead.add(letra);
        if(cont > 5) cont--;
    }

    for (int i = 0; i < symbolhead.size(); i++) {
        SymbolHead letra = (SymbolHead) symbolhead.get(i);
        letra.draw();
        if(!letra.alive) { symbolhead.remove(i); }
    }
}

char getRandomChar() {
    return chrlist.charAt((int) random(chrlist.length()));
}


