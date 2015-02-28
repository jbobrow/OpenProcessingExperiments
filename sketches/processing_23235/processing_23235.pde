
//Nicky's iScream Workshop 
//Where you buildyour own ice cream by clicking on the 
//ingredients to the right.
//You can change the flavors of the ingredients by hitting
//the foward and back buttons to either side of the individual
//ingredients.
//When completely satisfied with your custom ice cream,
//you can click the done button and a screenshot of your ice cream
//will be saved to your desktop.

PImage cone;PImage creamC;PImage creamS;PImage creamV;PImage creamM;
PImage create;PImage done;PImage flavor;PImage foward;PImage back;
PImage saved;PImage sprinklesC;PImage sprinklesM;PImage sprinklesS;
PImage sprinkles;PImage sprinklesV;PImage syrup;PImage syrupCa;PImage syrupCh;
PImage syrupS;PImage tabCa;PImage tabCh;PImage tabM;PImage tabS; PImage tabV;

PImage img;

boolean b;
int i1=0; int j1=0; int i2=0; int j2=0; int i3=0; int j3=0;
float seconds=0;

void setup(){
  size(800,600);
  smooth();
  colorMode(HSB,360,100,100);
  imageMode(CENTER);
  
  back = loadImage("back_button.png"); cone = loadImage("cone.png");
  creamC = loadImage("cream_c.png"); creamM = loadImage("cream_m.png");
  creamS = loadImage("cream_s.png"); creamV = loadImage("cream_v.png");
  create = loadImage("create_heading.png"); done = loadImage("done_button.png");
  flavor = loadImage("flavor_title.png"); foward = loadImage("foward_button.png");
  saved = loadImage("saved.png"); 
  sprinkles = loadImage("sprinkles_title.png"); sprinklesC = loadImage("sprinkles_chocolate.png");
  sprinklesM = loadImage("sprinkles_mint.png"); sprinklesS = loadImage("sprinkles_strawberry.png");
  sprinklesV = loadImage("sprinkles_vanilla.png"); syrup = loadImage("syrup_title.png");
  syrupCa = loadImage("syrup_caramel.png"); syrupCh = loadImage("syrup_chocolate.png");
  syrupS = loadImage("syrup_strawberry.png"); tabCa = loadImage("tab_caramel.png");
  tabCh = loadImage("tab_chocolate.png"); tabM = loadImage("tab_mint.png");
  tabS = loadImage("tab_strawberry.png"); tabV = loadImage("tab_vanilla.png");
  
  b = false;
  seconds=millis()/1000;
  
}

void draw(){
  background(#F75AA4);
 
  image(create,width/2,50);//heading "Create your iScream!"
  image(cone,width/2,400);//ice cream cone
  
  //your possible ice creams
  if(j1==1){
    image(creamV,width/2,250);
  }
  if(j1==2){
    image(creamS,width/2,250);
  }
  if(j1==3){
    image(creamM,width/2,250);
  }
  if(j1==4){
    image(creamC,width/2,250);
  }
  
  //your possible syrups
  if(j3==1){
    image(syrupS,width/2,285);
  }
  if(j3==2){
    image(syrupCa,width/2,285);
  }
  if(j3==3){
    image(syrupCh,width/2,285);
  }
  
  //your possible sprinkles
  if(j2==1){
    image(sprinklesC,width/2,225);
  }
  if(j2==2){
    image(sprinklesV,width/2,225);
  }
  if(j2==3){
    image(sprinklesS,width/2,225);
  }
  if(j2==4){
    image(sprinklesM,width/2,225);
  }
  
  //Flavor
  image(flavor,630,150);//title "flavor"
  image(creamV,630,250);//vanilla icea cream flavor -- default flavor
  image(tabV,630,340);//name of flavor, "vanilla" -- default flavor
  //When you've clicked on the "foward" button
  if(i1 == 1){
    image(creamS,630,250);
    image(tabS,630,340);
  }
  if(i1 == 2){
    image(creamM,630,250);
    image(tabM,630,340);
  }
  if(i1 == 3){
    image(creamC,630,250);
    image(tabCh,630,340);
  }
  
  //Sprinkles
  image(sprinkles,630,380);//title "sprinkles"
  image(sprinklesC,630,450);//chocolate sprinkles -- default flavor
  image(tabCh,630,520);//name of flavor, "chocolate" -- default flavor
  //when you've clicked on the "foward" button
  if(i2 == 1){
    image(sprinklesV,630,450);
    image(tabV,630,520);
  }
  if(i2 == 2){
    image(sprinklesS,630,450);
    image(tabS,630,520);
  }
  if(i2 == 3){
    image(sprinklesM,630,450);
    image(tabM,630,520);
  }
  
  //Syrup
  image(syrup,150,150);//title "syrup"
  image(syrupS,150,300);//strawberry syrup -- default flavor
  image(tabS,150,425);//name of flavor, "strawberry" -- default flavor
  if(i3 == 1){
    image(syrupCa,150,300);
    image(tabCa,150,425);
  }
  if(i3 == 2){
    image(syrupCh,150,300);
    image(tabCh,150,425);
  }
  
  //Buttons;
  //Flavor buttons
  image(foward,740,250);//foward button
  //image(back,515,250);//back button
  
  //Sprinkles buttons
  image(foward,740,450);//foward
  //image(back,515,450);//back
  
  //Syrup buttons
  image(foward,255,250);
  //image(back,40,250);
  
  //Done button
  image(done,150,550);
  
  
  if(i1%4 == 0){
    i1=0;
  }
  if(j1%5 == 0){
    j1=0;
  }
  if(i2%4 == 0){
    i2=0;
  }
  //if(j2%5 == 0){
    //j2=0;
  //}
  if(i3%3 == 0){
    i3=0;
  }
  if(j3%4 == 0){
    j3=0;
  }
  
  if(b == true){
    image(saved,width/2,height/2);
  }
  
  
}

void mousePressed(){
  b = false;
  
  //Flavor 
  //foward button
  if(dist(740,250,mouseX,mouseY) < 50){
    i1++;
    println("flavor: " + i1);
  }
 //select a flavor
 if(dist(630,250,mouseX,mouseY)<50 && i1==0){
   j1=1;
   println("j1:" + j1);
 }
 if(dist(630,250,mouseX,mouseY)<50 && i1==1){
   j1=2;
   println("j1:" + j1);
 }
 if(dist(630,250,mouseX,mouseY)<50 && i1==2){
   j1=3;
   println("j1:" + j1);
 }
 if(dist(630,250,mouseX,mouseY)<50 && i1==3){
   j1=4;
   println("j1:" + j1);
 }
  
  //Sprinkles foward
  if(dist(740,450,mouseX,mouseY) < 50){
    i2++;
    println("sprinkles" + i2);
  }
  //select a sprinkle
  if(dist(630,450,mouseX,mouseY)<50 && i2==0){
   j2=1;
   println("j2:" + j2);
 }
 if(dist(630,450,mouseX,mouseY)<50 && i2==1){
   j2=2;
   println("j2:" + j2);
 }
 if(dist(630,450,mouseX,mouseY)<50 && i2==2){
   j2=3;
   println("j2:" + j2);
 }
 if(dist(630,450,mouseX,mouseY)<50 && i2==3){
   j2=4;
   println("j2:" + j2);
 }

  
  //Syrup buttons
  if(dist(255,250,mouseX,mouseY) < 50){
    i3++;
    println("syrup" + i3);
  }
  //select a syrup
  if(dist(150,300,mouseX,mouseY)<100 && i3==0){
    j3=1;
    println("j3:" + j3);
  }
  if(dist(150,300,mouseX,mouseY)<100 && i3==1){
    j3=2;
    println("j3:" + j3);
  }
  if(dist(150,300,mouseX,mouseY)<100 && i3==2){
    j3=3;
    println("j3:" + j3);
  }
  
  //Done button
  if(dist(150,550,mouseX,mouseY)<50){
    img = get(300,149,200,400);
    img.save("MyIceCream.jpg");
    b = true;
    println("saved!");
  }
}

