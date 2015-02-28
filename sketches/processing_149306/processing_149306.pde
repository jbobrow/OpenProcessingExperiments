
color c = color(0);
Palette[] palettes;
boolean loaded = false;

void setup() {
    size(600,150);
    loadScript("http://www.colourlovers.com/api/palettes/top?numResults=100&showPaletteWidths=1&format=json&jsonCallback=Processing.getInstanceById(\"pjsComplexSketch\").createPalettes");
    textAlign(CENTER,CENTER);
}

void draw() {
    if(loaded && frameCount%60==0){
        palettes[int(random(palettes.length))].draw();
    }
    else if(!loaded){
        background(255);
        fill(0);
        int t=int(frameCount/30)%4;
        text((t==0)?"LOADING  ":
             (t==1)?"LOADING. ":
             (t==2)?"LOADING..":
             "LOADING...",width/2,height/2);
    }
}

void loadScript(String url) {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = url;
    script.async = true;
    document.body.appendChild(script);
}

void createPalettes(Object pal) {
    c = color(255);
    console.log("pal", pal.length);
    palettes = new Palette[pal.length];
    for(int i=0;i<palettes.length;i++){
        palettes[i] = new Palette(pal[i]);
    }
    loaded = true;
}

class Palette{
    String title;
    color[] c;
    float[] w;
    Palette(Object data){
        console.log(data);
        title = data.title;
        c = new color[data.colors.length];
        w = new float[data.colors.length];
        for(int i=0; i<c.length; i++){
            c[i] = unhex("ff"+data.colors[i]);
            w[i] = data.colorWidths[i];
        }
    }

    void draw(){
        noStroke();
        float start = 0;
        for(int i=0; i<c.length; i++){
            fill(c[i]);
            rect(width*start,0,width*w[i],height);
            start += w[i];       
        }
    }
}
