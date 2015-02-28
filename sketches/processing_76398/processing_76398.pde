
//Bumble Badness
//Group 5
//22/10/2012

void setup() {
  //load images
  start_new = loadImage("start_new.png");
  bee = loadImage("bee.png");
  bee_switch = loadImage("bee_switch.png");  
  bee_blank = loadImage("bee_blank.png"); 
  web = loadImage("web.png");
  times_up = loadImage("times_up.png");
  spider = loadImage("spider.png");
  flytrap = loadImage("flytrap.png");
  bird = loadImage("bird.png");
  garden = loadImage("garden.png");
  flower = loadImage("flowers.png");  
  winner = loadImage("winner.png");  
  //screen size
  size(600, 600);
  smooth();
  //noLoop();
  for (int i=0;i<obj;i++) //number of spiders etc as declared by global variable 'i'
  {
    spiders[i] = new Spiders(width+random(300000), random(100, 500)); //sets y random 30000 and height
  }
  for (int i=0;i<obj;i++)
  {
    flytraps[i] = new Flytraps(width+random(300000), 500); //all at ground level
  }
  for (int i=0;i<obj;i++)
  {
    // to delay the start of the birds
    birds[i] = new Birds(width+random(4000, 2000000), random(100, 350)); //sets y random 2000000 and height
  }
  for (int i=0;i<obj;i++)
  {
    flowers[i] = new Flowers(width+random(2000, 30000), 500); //all at ground level
    // change back to this     flowers[i] = new Flowers(width+random(2000,300000), 500);
  }
}

void draw() {
  background(255);

  if (menu==true) {
    menu();
  }
  if (rules==true) {
    rules();
    if (rules==false) {
      menu=true;
    }
  }
  if (q==true) { //sets gameplay loop
    if (menu==false && energy == true) {
      // mousePress();
      keyInput();
    }
    if (energy==false) {
      //     lives--;
      no_energy();
    }
    if (question==true && q==true);
    questions();

    collision();
    limits();
  }
  if (key=='b') { //gameplay stopped when b pressed
    q=false;

    if (q==false) {
      q=true;
      keyInput();
    }
  }
}


