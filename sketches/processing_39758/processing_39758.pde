
int data[] = {31,54,41,53};
int data1[] = {17,3,7,8};
int data2[] = {42,14,45,15};
int data3[] = {10,29,7,24};



void setup(){
  size(1300,800);
  smooth();
  colorMode(HSB,360,100,100);
 
  
  
  
}

void draw(){
  background (200);
  fill(0);
  textSize(50);
  text("The Dreamer as the Victim of Agression", 15,50);
 noFill();

  textSize(15);
  fill(50);
  text("Sex and Culture of Dreamer", 15,100);
  noFill();
   fill(100);
  text("Mehinaku Men", 15,200);
   textSize(15);
  text("American Men", 15,300);
   textSize(15);
  text("Mehinaku Women", 15,500);
   textSize(15);
  text("American Women", 15,600);
  
  noFill();
  
   fill(10);
   textSize(20);
  text("Identity of Aggressor in the Dream", 600,780);
  
  fill(0);
   textSize(20);
  text("Men", 250,720);
  textSize(20);
  text("Women", 550,720);
  textSize(20);
  text("Animal", 850,720);
  textSize(20);
  text("spirit/Monster", 1150,720);
  
  
noFill();
 
  for(int A = 0; A < data.length; A++){
    float ellsize= map(data [A], 30,60, 0,100);
    textSize(ellsize);
    fill(200, 20,ellsize);
    //ellipse(I*150+100,100,ellsize,ellsize);
    //textSize (data [I]);
    text("Z",200, A*150+200);
    noFill();
    fill(200, 20,ellsize);
    textSize(14);
    text(data[A], 350, A * 150 + 200);
   }
   
     for(int B= 0; B < data1.length; B++){
    float ellsizea= map(data1 [B], 0,20, 0,100);
    textSize(ellsizea);
    fill(10, 20,ellsizea);
    //ellipse(I*150+100,100,ellsize,ellsize);
    //textSize (data [I]);
    text("Z",500, B*150+200);
    noFill();
    fill(10, 20,ellsizea);
    textSize(14);
    text(data1[B], 650, B * 150 + 200);
   }
   
   for(int C= 0; C < data2.length; C++){
    float ellsizeb= map(data2 [C], 10,50, 0,100);
    textSize(ellsizeb);
    fill(100, 20,ellsizeb);
    //ellipse(I*150+100,100,ellsize,ellsize);
    //textSize (data [I]);
    text("Z",800, C*150+200);
    noFill();
    fill(100, 20,ellsizeb);
    textSize(14);
    text(data2[C], 950, C * 150 + 200);
   }
   
   for(int D= 0; D < data3.length; D++){
    float ellsizec= map(data3 [D], 5,30, 0,100);
    textSize(ellsizec);
    fill(250, 20,ellsizec);
    //ellipse(I*150+100,100,ellsize,ellsize);
    //textSize (data [I]);
    text("Z",1100, D*150+200);
    noFill();
    fill(250, 20,ellsizec);
    textSize(14);
    text(data3[D], 1250, D * 150 + 200);
   }
   
   
  println(data.length);
}


