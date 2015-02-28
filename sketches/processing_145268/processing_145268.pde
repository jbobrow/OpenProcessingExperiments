
//moviment del personatge
int _x;
int _y;
int velX;
int velY;

void setup(){
//nom i titol del treball
println("Camil Raich, Grup 3. Informatica");

  size(500,500);
_x = width/2;
_y = height/2;
velX = 4;
velY = 4;
}

void draw(){
int a;
int b;
a=width/2;
b=height/2;



background(115,178,255);
fill(_x,229,_y);


//posicio
_x = _x+velX;
_y = _y+velY;
strokeWeight(a/25);

stroke(115,178,255);

//cap
ellipse(_x,_y-65,a/1.75,b/2);

//cos
rect(_x-a/1.75/2,_y-b/2.20/2,a/1.75,b/2.20);

//cames
strokeWeight(a/1000);
stroke(30,229,88);

rect(_x+10,_y+35,a/8,b/2.5);

rect(_x-40,_y+35,a/8,b/2.5);

ellipse(_x+25,_y+135,a/8,b/8);
ellipse(_x-25,_y+135,a/8,b/8);


//braços
rect(_x-110,_y-35,a/8,b/3);
rect(_x+80,_y-35,a/8,b/3);


ellipse(_x-95,_y-37,a/8,b/8);
ellipse(_x-95,_y+47,a/8,b/8);


ellipse(_x+95,_y-37,a/8,b/8);
ellipse(_x+95,_y+47,a/8,b/8);


//antenas
rect(_x-20,_y-135,a/50,b/10);
rect(_x+20,_y-135,a/50,b/10);


fill(115,178,255);
stroke(115,178,255);
strokeWeight(a/1000);

//ulls
ellipse(_x+20,_y-100,a/17,b/17);
ellipse(_x-20,_y-100,a/17,b/17);

//amagar el ratoli
noCursor();


//posicio x
if((_x-115<0)||(_x+115>width)){
  velX = -velX;
}

//posicio Y
if((_y-140<0)||(_y+150>height)){
  velY = -velY;
}
}


//al pressionar el ratolí la figura torna al centre
void mousePressed(){
 _x=width/2;
 _y=height/2;
}

