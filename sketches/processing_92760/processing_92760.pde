
/*
Minimalistic PolarClock, by @ramayac
*/
int mo, w, d, h, m, s, largo, step, ini;

void setup (){
    size (500,500);
    background (#212121);
    colorMode(HSB, 60);
    noStroke();
    step = 35;
    ini = -90;
    smooth();
}
 
void draw() {
    background (#212121);
    s = second ();  m = minute (); h = hour (); d = day(); mo = month();
    
    arco(240, s);
    arco(200, m);
    arco(160, (h/2)*5);
    
    arco(80, d*2);
    arco(40, mo*5);
}

void arco(int posicion, int largo){
    float r = radians(largo*6+ini);
    fill(largo, 60, 50);
    arc(width/2, height/2, posicion, posicion, radians(ini), r);
    fill(#212121);
    arc(width/2, height/2, posicion-step, posicion-step, radians(ini-1), r+1);//+1 hack :)
}
