


actor[] main;

int ran=15;

void setup(){
  size(400,400);
  background(0);
  ellipseMode(CENTER);
  rectMode(CENTER);
  smooth();

  main = new actor[1000];

  for(int x=0; x< main.length;x++){
    main[x]  =  new actor(9,round(random(10,30)));
    main[x].set_location(width/2,height/2);
    main[x].summerBrush.init_brush(main[x].get_y_loc(),main[x].get_y_loc());  
  }

}

int x=0;

void draw() {

  for(int y=0; y<main.length;y++){
    main[y].actor_act();
  }

}

void keyPressed(){
}

void keyReleased(){
}























