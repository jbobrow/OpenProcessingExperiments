
int aumenta=0;
void setup(){
size(600,600);
}
void draw(){ 
colorMode(HSB);  
fill(aumenta,201, 132);
ellipse(aumenta,height/2,aumenta+2,aumenta+56);
aumenta+=9;
fill(aumenta,22,22);
}

