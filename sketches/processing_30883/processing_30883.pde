
/* vim: set ft=java sw=4 ts=4 expandtab :*/

/* This program lets you type a ransom letter - Jeremy English */

void get_poly(int top, int left, int width, int height, int [] poly, float perc)
{
    int w = round(width * perc);
    int d1 = round(random(-1 * w, w));
    int d2 = round(random(-1 * w, w));
    int d3 = round(random(-1 * w, w));
    int d4 = round(random(-1 * w, w));

    poly[0] = left + d1;
    poly[1] = top + d1;

    poly[2] = left + width + d2;
    poly[3] = top + d2;

    poly[4] = left + width + d3;
    poly[5] = top + height + d3;

    poly[6] = left + d4;
    poly[7] = top + height + d4;
}
    

class Glyph{
    public PImage bitmap;
    public int width;
    public int height;
    public float theta;

    Glyph(){
        bitmap = null;
        width = 0;
        height = 0;
        theta = random(-20,20)/100;
    }
}

class Cutout{
    private char c;
    private Glyph glyph;

    Cutout(char c){
        this.c = c;
        glyph = null;
    }

    public boolean is(char c){
        return (this.c == c);
    }

    public Glyph getGlyph(){
        return this.glyph;
    }

    public String toString(){
        return "" + c;
    }

    public float width(){
        return textWidth(c);
    }

    public float height(){
        float descent = textDescent();
        float ascent = textAscent();
        return descent + ascent;
    }

    public void makeGlyph(){
        background(color(0,0,100,100));

        float corner_off = random(2,5)/100;
        float w_pad = this.width() * 0.03;
        float h_pad = this.height() * 0.03;
        color fg = color((int)random(0, 360), 100, 100, 100);
        color bg = color((hue(fg) + 180) % 360, 100, 100, 100);
        float max_h = this.height() + textDescent() + (h_pad * 2);
        int [] poly  = new int[8];

        get_poly(0, 0, 
                round(this.width() + (w_pad * 2)), 
                round(max_h),
                poly,  corner_off);

        fill(bg);
        stroke(bg);
        quad(poly[0],poly[1],poly[2],poly[3],poly[4],poly[5],poly[6],poly[7]);
        
        fill(fg);
        text(c, w_pad, height());

        this.glyph = new Glyph();

        float fbitH = max_h;
        fbitH *= 1 + corner_off;

        float fbitW = this.width() + (2 * w_pad);
        fbitW *= 1 + corner_off;
    
        int bitW = round(fbitW);
        int bitH = round(fbitH);

        glyph.bitmap = createImage(bitW, bitH, ARGB);

        loadPixels();
        glyph.bitmap.loadPixels();

        for(int y = 0; y < bitH; y++){
            for(int x = 0; x < bitW; x++){
                glyph.bitmap.pixels[(y * bitW) + x] = pixels[(y * width) + x];
            }
        }

        glyph.bitmap.updatePixels();
        updatePixels();
        glyph.width = bitW;
        glyph.height = bitH;
    }
}

class Cursor{
    private float x;
    private float y;
    private float max_height;
    final private int DEF_HEIGHT = 40;
    final private int DEF_WIDTH  = 40;

    Cursor(float x, float y){
        this.x = x;
        this.y = y;
        this.max_height = 0;
    }

    public void output(Cutout c){
        if (c.is(' ')){
            x += DEF_WIDTH;
        }
        else if (c.is(ENTER)){
            if (max_height == 0)
                y += DEF_HEIGHT;
            else
                y += max_height;
            x = 0;
        }
        else{
            Glyph g = c.getGlyph();
            pushMatrix();
            translate(x + (g.width/2), y + (g.height/2));
            rotate(g.theta);
            image(g.bitmap, -1 * (g.width/2), -1 * (g.height/2));
            popMatrix();
            x += g.width;
            max_height = max(max_height, g.height);
        }
    }
}

Vector text = new Vector();
final char BACKSPACE = (char)0x08;
final char ENTER     = (char)0x0a;
String [] fonts = {
    "Algerian-48.vlw",
    "Bauhaus93-48.vlw",
    "BodoniMT-55.vlw",
    "Castellar-48.vlw",
    "ComicSansMS-48.vlw",
    "CooperBlack-40.vlw",
    "ForteMT-52.vlw",
    "SansSerif.bold-48.vlw",
    "TrebuchetMS-42.vlw"
};

String currentFont; /* XXX Used to weed out the fonts I dont' like */

void keyPressed() {
    char c = key;
    if (0x20 <= key && key <= 0x7e){
        text.add(new Cutout(c));
    }
    else if (key == BACKSPACE){
        if (text.size() > 0){
            text.remove(text.size() -1);
        }
    }
    else if (key == ENTER){
        text.add(new Cutout(c));
    }
    else{
        println("Unknown key");
    }
}

void setFont(){
    int i = (int)random(0, fonts.length);
    currentFont = fonts[i];
    PFont pf = loadFont(fonts[i]);
    textFont(pf);
}


void typeDefault(){
    PFont pf = loadFont(fonts[0]);
    textFont(pf);
    fill(color(130,50,50));
    text("Type Something...", 10, 250);
}

void setup(){
    size(500, 500);
    colorMode(HSB,360,100,100, 100);
    setFont();
}


void draw(){
    setFont();
    float descent = textDescent();
    float ascent = textAscent();
    Cursor cur = new Cursor(0,0);

    /*Make sure we have a glyph for ever character*/
    for (int i = 0; i < text.size(); i++){
        Cutout co = (Cutout)text.elementAt(i);
        Glyph g = co.getGlyph();
        if (g == null){
            println(currentFont);
            co.makeGlyph();
        }
    }
    
    background(360,0,100,100);
    if (text.size() == 0){
        typeDefault();
    }
    else{
        for (int i = 0; i < text.size(); i++){
            cur.output((Cutout)text.elementAt(i));
        }
    }
    
}

