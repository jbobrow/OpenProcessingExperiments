
private final int app_width = 576;
private final int app_height = 768;


//private Timer timer_monster;
//private Timer timer_bullet;

private int count_monster=0; //
private int count_bullet=0;

private Background background_;
private Pilot pilot;
private ArrayList<Monster> monsters = new ArrayList<Monster>();
private ArrayList<Bullet> bullets = new ArrayList<Bullet>();

void setup(){
  size(576,768);
  background_ = new Background();
  pilot = new Pilot();
  //timer_monster = new Timer(3000);
  //timer_bullet = new Timer(80);
  createMonsters();
  //timer_monster.start();
  //timer_bullet.start();
  frameRate(60);
  //println(frameRate);
  
}

void draw(){
  background_.move();
  background_.display();
  
  refreshMonsters();
  /*
  if(timer_monster.isPassed()){
    createMonsters();
    timer_monster.start();
  }
  */
  
  if(count_monster==200){
    createMonsters();
    count_monster=0;
  }
  
  for(int i=0;i<monsters.size();i++){
    monsters.get(i).move();
    monsters.get(i).display();
  }
  
  refreshBullets();
  /*
  if(timer_bullet.isPassed()){
    createBullets();
    timer_bullet.start();  
  }
  */
  if(count_bullet==3){
    createBullets();
    count_bullet=0;
  }
  
  for(int i=0;i<bullets.size();i++){
    bullets.get(i).move();
    bullets.get(i).display();
  }
  
  pilot.display();
  
  countVariant();
}

void mouseDragged(){
  pilot.move(mouseX-pmouseX);
}

private void countVariant(){
  ++count_monster;
  ++count_bullet; 
}

private void createMonsters(){
  monsters.add(new Monster(0,int((app_width/5)/2+(app_width/5)*0)));
  monsters.add(new Monster(0,int((app_width/5)/2+(app_width/5)*1)));
  monsters.add(new Monster(0,int((app_width/5)/2+(app_width/5)*2)));
  monsters.add(new Monster(0,int((app_width/5)/2+(app_width/5)*3)));
  monsters.add(new Monster(0,int((app_width/5)/2+(app_width/5)*4)));
}

private void refreshMonsters(){
  for(int i=monsters.size()-1;i>0;i--){
    for(int j=0;j<bullets.size()-1;j++){
      monsters.get(i).checkHit(bullets.get(j));  
    }
    
    if(monsters.get(i).isDead()){
      monsters.remove(i); 
    }
  }
}



private void createBullets(){
  bullets.add(new Bullet(0,pilot.getXPos())); 
}

private void refreshBullets(){
  for(int i=bullets.size()-1;i>0;i--){
    if(bullets.get(i).isDead()){
      bullets.remove(i); 
    }
  }
}
