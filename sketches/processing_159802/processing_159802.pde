
ifloat r;   //this is a short game
float g;   //i would like to pursue it
float b;   //its a one second maze solve
float a;   //for now. in the future of course more time for toughet puzzle

float diam; //the maze walls will be poisonous but the arent rihgt now
int count;  //growing size will complicate navigating them
int state;  //time limit will be enforced

void setup() {  //thats about it reall
  count = 0;    //I guess I could include random stuff now.
  state = 0;    //like the fact that there is a company in Taiwain that makes dinnerware out of wheat
  
  size(500,500); //or I could just leave it empty
  background(255);
  smooth();    
  strokeWeight(20);
  line(50,0,50,250);
  line(100,250,100,500); //thats better
  line(150,0,150,250);
  line(200,250,200,500);
  line(250,0,250,250);  //wait its not
  line(300,250,300,500); //its weird
  line(350,0,350,250);
  line(400,250,400,500);
  line(450,0,450,250);
}

void draw() {
r = random(255); //all this is to make the maze look 
  g = random(255); //like a low level picasso
  b = random(255); //kinda, but nor really
  a = random(255); 
  diam = random(20);
  noStroke();
  
  count++;
  if(count > 24){
    count = 0;
    state++;
    if(state > 8){   //the stuff below is to draw the first basic maze
       state = 0;
       background(255);
         strokeWeight(20);
         line(50,0,50,250);
          line(100,250,100,500);
          line(150,0,150,250);    //how about some poetry to finish it off
          line(200,250,200,500);
          line(250,0,250,250);    //haikus can be fun
          line(300,250,300,500);  //but sometimes they don't make cents
          line(350,0,350,250);    //cause who buys haikus
          line(400,250,400,500);
          line(450,0,450,250);   //get it?
    } 
 
  }                              //I'll go now
  fill(r,g,b,a);
  diam = state * 20;             //bye!
  ellipse(mouseX,mouseY,diam,diam);
 
  
}
