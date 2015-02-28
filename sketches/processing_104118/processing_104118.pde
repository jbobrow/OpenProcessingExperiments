
PImage img[] = new PImage[11];

String txt[] = {
  "", 
  "This is the first stage of limb growth in an embryo, flipper like bulges emerge", 
  "The bulge grows out further",
  "Digits (fingers) start to form",
  "Bones become more prominent, the bulge is still growning out",
  "The limb now has a more recognisable shape, you see the five digit positions whilst webbed",
  "",
  "This is the first stage of limb growth in an embryo, flipper like bulges emerge",
  "The bulge grows out, further than the arms at this stage ",
  "Digits (toes) start to form with connecting bones",
  "Bones become more prominent, The limb now has a more recognisable shape, you see the five digit positions whilst webbed",
};

PFont f;


void setup() {
  background(255);
  smooth();

  img[0]=loadImage("arms.jpg");
  img[1]=loadImage("1fa.jpeg");
  img[2]=loadImage("2fa.jpeg");
  img[3]=loadImage("3fa.jpeg");
  img[4]=loadImage("4fa.jpeg");
  img[5]=loadImage("5fa.jpeg");
  img[6]=loadImage("legs.jpg");
  img[7]=loadImage("1hl.jpeg");
  img[8]=loadImage("2hl.jpeg");
  img[9]=loadImage("3hl.jpeg");
  img[10]=loadImage("5hl.jpeg");

  size(1000, 800);

  f = createFont("AmericanTypewriter-CondensedBold-48", 12);
  textFont(f);
}

//int textsize= 40;
int i=0;

void draw() {
  background(255);

  i = (int)map(mouseX, 0, width, 0, 11);  
  image(img[i], 100, 100, 800, 600);


  textSize(18);
  text(txt[i], 50, 50);
  fill(0);
}
