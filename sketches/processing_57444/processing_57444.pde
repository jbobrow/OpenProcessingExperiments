

PShape Corn;
PShape farm;
PShape barn;
PShape Tracktor;
PShape Roosterleftside;
PShape HenRightside;

float xpos=-300;
float rpos= 200;
float epos= -470;
float bg=0;
boolean button=false;

void setup(){
size (1000,600);


farm  = loadShape("LandscapeFarmcopy.svg");
barn = loadShape("Barn_Door.svg");
Tracktor =loadShape("Tracktor.svg");
Roosterleftside = loadShape("Roosterleftside.svg");
HenRightside= loadShape("HenRightside.svg");
Corn = loadShape("Corn.svg");



}

void draw(){
//blue sky 300
background(90,300,440);
smooth();
noStroke();
//Sunfill
fill(xpos,224,79);
//SUN
ellipse(10,5,200,200);
shape (farm, 0, 0, 1000, 600);
shape(Tracktor,xpos,295,712,320);
shape(barn,0,359,369,220);
shape(Roosterleftside,3,1,496,276);//3
shape(HenRightside,492,xpos,450,300);//2
shape(Corn,800,459,239,epos);
shape(Corn,100,470,239,epos);
fill(0,0,0,bg);
bg=map(xpos, -300, 1200, 0, 255);

rect(0, 0, width, height);

//tractor moves
xpos = xpos +1;
if(xpos>1200){
  xpos=-300;
}
  //corn appears in sky falls down streches and disapears at the boottom
 epos= epos +2;
 if(epos>1200){
   epos= -470;
} //second corn also no Error on my computer//
epos= epos +2;
 if(epos>1200){
   epos= -470;
 }
 
 

 
 


println(bg);

}



