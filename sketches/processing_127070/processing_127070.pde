
/*@pjs preload="apple1.png, apple2.png, apple3.png, apple4.png, apple5.png, apple6.png, apple7.png, apple8.png, apple9.png, apple10.png, apple11.png, apple12.png, apple_white.png, apple.png";*/
PImage img; //gazou wo kakunou surutameno hennsuu

//fure-mu no settei
int numFrames = 14; //fure-mu suu no jyougenn settei
int frame = 0; //hajimari no fure-mu
PImage[] images = new PImage[15]; //kurikaesu basyo no fure-mu
int flag = 0; //flag no hanntei kasyo
int eSize = 5; //en no saizu

//settei
void setup() {
  size(450, 450); //saizu
  background(#c54a24); //haikeisyoku
  frameRate(5); //fure-mu suu no settei

//pixel no settei  
  for(int x=0; x<=width; x+=50){
 
  if(x < width/2){ 
    fill(200);  
  }
  else{    
    fill(100, 130, 0, 20);  
  }
  ellipse(x, height/2, eSize, eSize);
  println("x=" + x); 
}

 //yomikonnderu gazou
  images[0] = loadImage("Image/apple_white.png");  //image0 ni kono gazou wo dainyuu
  images[1] = loadImage("Image/apple1.png"); 
  images[2] = loadImage("Image/apple2.png"); 
  images[3] = loadImage("Image/apple3.png"); 
  images[4] = loadImage("Image/apple4.png");
  images[5] = loadImage("Image/apple5.png");
  images[6] = loadImage("Image/apple6.png");
  images[7] = loadImage("Image/apple7.png");
  images[8] = loadImage("Image/apple8.png");
  images[9] = loadImage("Image/apple9.png");
  images[10] = loadImage("Image/apple10.png");
  images[11] = loadImage("Image/apple11.png");
  images[12] = loadImage("Image/apple12.png");
  images[13] = loadImage("Image/apple.png");
}

//saigoni ittara kurikaesu
void draw() {
  if (flag == 1) { //1fure-mu me ni tobu
    frame++; 

//ru-pu syori
    if (frame == 14) { //13 koetara saisyo ni modoru
      frame = 0; //saisyo no fure-mu no banngou
    }
    image(images[frame], 0, 0); //gazou wo hyouji
  }
}

//mausu ga osaretatoki hajimaru
void mousePressed() {
  flag = 1; //hajimaru fure-mu
}

//numFrames = saigo no fure-mu



