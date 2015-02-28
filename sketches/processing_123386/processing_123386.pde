
int monsterX;
int monsterY;

int richting;
int teller;

boolean test;

void setup(){
size(300,300);
monsterX = 100;
monsterY = 100;
richting = 5;
teller = 0;
test = true;
}

void draw(){
//hoofd
background(255);
stroke(0);
if(test == true){
  fill(0,168,0);
}
if(test == false){
  fill(255,0,0);
}
stroke(0);
ellipseMode(CENTER); 
ellipse(monsterX,monsterY,100,100);  //hoofd

stroke(0);
fill(255);
ellipse(monsterX+30,monsterY-10,35,35);                  //oog
ellipse(monsterX-31,monsterY-10,35,35);                  //oog

fill(0);
rect(monsterX-20,monsterY+30,38,76);   //mond

fill(250,0,0);
ellipse(monsterX-1,monsterY+96,30,20); //tong

line(monsterX-4,monsterY+96,monsterX+14,monsterY+83);        //tongspleet

fill(255);
rect(monsterX-20,monsterY+30,38,10);    //tanden

stroke(0);
line(monsterX-41,monsterY+4,monsterX-41,monsterY+19);       //wallen
line(monsterX-37,monsterY+7,monsterX-37,monsterY+22);
line(monsterX-33,monsterY+8,monsterX-33,monsterY+16);

monsterX = monsterX + richting;

if(monsterX > width || monsterX < 0){
  richting = -richting;
if(teller == 10){
  teller = 0;
  test=!test;
}

println(teller);
teller = teller + 1;
}
                         
}

