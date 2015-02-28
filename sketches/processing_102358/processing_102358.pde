
import controlP5.*;

ControlP5 cp5;

DropdownList enemy;
DropdownList weapon;
DropdownList armour;

Slider health10s;
Slider health30s;
Slider foods;
Slider gemss;

Textfield HP;

int health10, health30, gems, food;

Button play;

player Brom;
enemy Enemy;

int state;
float timer;

void setup(){
  size(600, 400);
  background (255); 
  
  Brom = new player(150, 5, 0, "Brom");
  Enemy = new enemy("goblin1");
  
  cp5 = new ControlP5(this);
  
  HP = cp5.addTextfield("HP")
    .setPosition(475, 110)
    .setWidth(100)
    ;
  HP.getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setColor(0);
  
  armour = cp5.addDropdownList("armour").setPosition(475, 100);
  armour.addItem("none", 0);
  armour.addItem("shield", 1);
  armour.addItem("full body", 2);
  customize(armour);
  
  weapon = cp5.addDropdownList("weapon").setPosition(475, 75);
  weapon.addItem("hand", 0);
  weapon.addItem("knife", 1);
  weapon.addItem("sword", 2);
  weapon.addItem("lance", 3);
  customize(weapon);
  
  enemy = cp5.addDropdownList("enemy").setPosition(475, 50);     
  enemy.addItem("goblin1", 0);
  enemy.addItem("goblin2", 1);
  enemy.addItem("troll", 2);
  enemy.addItem("gryphon", 3);
  enemy.addItem("gargoyle", 4);
  enemy.addItem("dmitri", 5);
  enemy.addItem("pasha", 6);
  enemy.captionLabel().set("enemy");
  customize(enemy);
  
  health10s = cp5.addSlider("health10")
    .setPosition(475, 165)
    .setLabel("+10 potions")
    .setWidth(100)
    .setRange(0, 3)
    .setNumberOfTickMarks(4)
    .setSliderMode(Slider.FLEXIBLE)
    ;
  health10s.getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setColor(0);
  health10s.getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setColor(0);
  
  health30s = cp5.addSlider("health30")
    .setPosition(475, 195)
    .setLabel("+30 potions")
    .setWidth(100)
    .setRange(0, 3)
    .setNumberOfTickMarks(4)
    .setSliderMode(Slider.FLEXIBLE)
    ;
  health30s.getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setColor(0);
  health30s.getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setColor(0);
  
  gemss = cp5.addSlider("gems")
    .setPosition(475, 255)
    .setLabel("Gems")
    .setWidth(100)
    .setRange(0, 16)
    .setNumberOfTickMarks(17)
    .setSliderMode(Slider.FLEXIBLE)
    ;
  gemss.getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setColor(0);
  gemss.getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setColor(0);
  
  foods = cp5.addSlider("food")
    .setPosition(475, 225)
    .setLabel("Food")
    .setWidth(100)
    .setRange(0, 6)
    .setNumberOfTickMarks(7)
    .setSliderMode(Slider.FLEXIBLE)
    ;
  foods.getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setColor(0);
  foods.getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setColor(0);
  
//  play = cp5.addButton("play")
//    .setPosition(500, 270)
//    .setSize(50, 15)
//    ;

  state = 0;
}

void draw(){
  background (255); 

  stroke(0);
  fill(0);
  line(450, 0, 450, 400);
  line(0, 300, 450, 300);
  
  textAlign(LEFT);
  textSize(12);
  text("Inventory", 475, 155);
  
  switch ( state ) {
    case 0:
      stroke(0);
      fill(255);
      rect(20, 335, 55, 20);
      rect(120, 335, 75, 20);
      
      fill(0);
      textSize(15);
      text("Attack", 25, 350);
      text("Inventory", 125, 350);
      break;
      
    case 1:
      float r = random(100);
      fill (0);
      if (r > Enemy.getProb()) {
        text("Brom's attack was successful", 25, 350);
        Enemy.setHp(Enemy.getHp() - Brom.getAttack());
        if (Enemy.getHp() <= 0) state = 7;
        else state = 2;
      } else {
        println(r + " " + Enemy.getProb());
        text("Brom's attack missed", 25, 350);
        state = 3;
      }
      break;
    
    case 2:
      text("Brom's attack was successful", 25, 350);
      if (millis() - timer > 2500) {
        timer = millis();
        state = 4;
      }
      break;
      
    case 3:
      text("Brom's attack missed", 25, 350);
      if (millis() - timer > 2500) {
        timer = millis();
        state = 4;
      }
      break;
      
    case 4:
      float p = random(100);
      fill (0);
      if (p < Enemy.getProb()) {
        text(Enemy.getNname() + "'s attack was successful", 25, 350);
        Brom.setHp(Brom.getHp() - Enemy.getAttack() + Brom.getDefense());
        if (Brom.getHp() <= 0) state = 8;
        else state = 5;
      } else {
        text(Enemy.getNname() + "'s attack missed", 25, 350);
        state = 6;
      }
      break;
      
    case 5:
      text(Enemy.getNname() + "'s attack was successful", 25, 350);
      if (millis() - timer > 2500) {
        state = 0;
      }
      break;
      
    case 6:
      text(Enemy.getNname() + "'s attack missed", 25, 350);
      if (millis() - timer > 2500) {
        state = 0;
      }
      break;
    
    case 7:
      text(Enemy.getNname() + " was defeated", 25, 350);
      if (millis() - timer > 2500) {
        state = 0;
      }
      break;
      
    case 8:
      text("Brom was defeated", 25, 350);
      Brom.setHp(0);
      if (millis() - timer > 5000) {
        state = 0;
      }
      break;
      
    case 9:
      if (health10 > 0) {
        text("+10", 25, 340);
        rect(25, 350, 30, 30);
      }
      
      if (health30 > 0) {
        text("+30", 100, 340);
        rect(100, 350, 30, 30);
      }
      
      if (food > 0) {
        text("food", 175, 340);
        rect(175, 350, 30, 30);
      }
      
      if (gems > 0) {
        text("gems", 250, 340);
        rect(250, 350, 30, 30);
      }      
      break;
    
  }
  
  
  Brom.drawMe();
  Enemy.drawMe();
}

void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.captionLabel().style().marginTop = 3;
  ddl.captionLabel().style().marginLeft = 3;
  ddl.valueLabel().style().marginTop = 3;
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}

//public void play(int theValue) {
////  println("a button event from buttonB: "+theValue);
//  
////  Enemy.setNname(enemy.getListBoxItems());
////  println(Enemy.getNname());
//}

void controlEvent(ControlEvent theEvent) {
  // DropdownList is of type ControlGroup.
  // A controlEvent will be triggered from inside the ControlGroup class.
  // therefore you need to check the originator of the Event with
  // if (theEvent.isGroup())
  // to avoid an error message thrown by controlP5.
  
  if (theEvent.getName() == "enemy"){
    Enemy.setNname(enemy.getItem((int)theEvent.value()).getName());
//    println(Enemy.getNname());    
  }
  
  if (theEvent.getName() == "weapon"){
    Brom.setAttack(weapon.getItem((int)theEvent.value()).getName());
//    println(Brom.getAttack());    
  }
  
  if (theEvent.getName() == "armour"){
    Brom.setDefense(armour.getItem((int)theEvent.value()).getName());
//    println(Brom.getDefense());    
  }
  
  if(theEvent.isAssignableFrom(Textfield.class)) {
    Brom.setHp(float(theEvent.getStringValue()));
//    println(Brom.getHp()); 
  }
}

void mouseClicked() {
  if (state == 0) {
    if (mouseX >= 20 && mouseX <= 75 && mouseY >= 335 && mouseY <= 355) {
  //    println("attack");
      state = 1;
      timer = millis();
    } 
    
    if (mouseX >= 120 && mouseX <= 195 && mouseY >= 335 && mouseY <= 355) {
  //    println("inventory");
      state = 9;
    }
  }
  
  if (state == 9) {
    if ((mouseX >= 25 && mouseX <= 55 && mouseY >= 350 && mouseY <= 380) && health10 > 0) {
      health10s.setValue(health10-1);
      Brom.setHp(Brom.getHp() + 10);
      if (Brom.getHp() > 150) Brom.setHp(150);
      state = 0;
    } 
    
    if ((mouseX >= 100 && mouseX <= 130 && mouseY >= 350 && mouseY <= 380) && health30 > 0) {
      health30s.setValue(health30-1);
      Brom.setHp(Brom.getHp() + 30);
      if (Brom.getHp() > 150) Brom.setHp(150);
      state = 0;
    }
    
    if ((mouseX >= 175 && mouseX <= 205 && mouseY >= 350 && mouseY <= 380) && food > 0) {
      foods.setValue(food-1);
    }
    
    if ((mouseX >= 250 && mouseX <= 280 && mouseY >= 350 && mouseY <= 380) && gems > 0) {
      gemss.setValue(gems-1);
    }
  }
  
  
}

class enemy{
  float hp;
  float maxHP;
  float attack;
  float defense;
  float prob;
  String name;

  enemy (String nname){
    name = nname;
    
    if (name.equals("goblin1")) { hp = 20; maxHP = 20; attack = 5; prob = 2.0/6.0; }
    if (name.equals("goblin2")) { hp = 20; maxHP = 20; attack = 10; prob = 3.0/6.0; }
    if (name.equals("troll")) { hp = 50; maxHP = 50; attack = 20; prob = 2.0/6.0; }
    if (name.equals("gryphon")) { hp = 60; maxHP = 60; attack = 40; prob = 4.0/6.0; }
    if (name.equals("gargoyle")) { hp = 80; maxHP = 80; attack = 30; prob = 3.0/6.0; }
    if (name.equals("dmitri")) { hp = 120; maxHP = 120; attack = 40; prob = 3.0/6.0; }
    if (name.equals("pasha")) { hp = 150; maxHP = 150; attack = 50; prob = 4.0/6.0; }    
  }  
  
  void setNname (String nname){
    if (name.equals("goblin1")) { name = nname; hp = 20; maxHP = 20; attack = 5; prob = 2.0/6.0; }
    if (name.equals("goblin2")) { name = nname; hp = 20; maxHP = 20; attack = 10; prob = 3.0/6.0; }
    if (name.equals("troll")) { name = nname; hp = 50; maxHP = 50; attack = 20; prob = 2.0/6.0; }
    if (name.equals("gryphon")) { name = nname; hp = 60; maxHP = 60; attack = 40; prob = 4.0/6.0; }
    if (name.equals("gargoyle")) { name = nname; hp = 80; maxHP = 80; attack = 30; prob = 3.0/6.0; }
    if (name.equals("dmitri")) { name = nname; hp = 120; maxHP = 120; attack = 40; prob = 3.0/6.0; }
    if (name.equals("pasha")) { name = nname; hp = 150; maxHP = 150; attack = 50; prob = 4.0/6.0; }  
  }
  
  void setHp (float hhp){
    hp = hhp;
  }
  
  void setProb (float pprob){
    prob = pprob;
  }
  
  float getHp (){
    return hp;
  }
  
  float getAttack (){
    return attack;
  }
  
  float getDefense (){
    return defense;
  }
  
  float getProb (){
    return prob * 100.0;
  }
  
  String getNname (){
    return name; 
  }
  
  void drawMe(){
    pushMatrix();
    translate(50, 50);
    fill(0);
    noStroke();
    textAlign(LEFT);
    textSize(20);
    text(name.toUpperCase(), 0, 0);
    textSize(10);
    text("HP: ", 0, 15);
    textAlign(RIGHT);
    textSize(15);    
    text(round(hp) + "  /  " + round(maxHP),  128, 30);
    
    stroke(0);
    fill(255);
    rect(25, 8, 100, 5);
    fill(0);
    rect(25, 8, (hp/maxHP) * 100, 5);
    popMatrix();  
  }
}
class player{
  float hp;
  float maxHP;
  float attack;
  float defense;
  String name;

  player (float hhp, float aattack, float ddefense, String nname){
    hp = hhp;
    maxHP = hhp;
    attack = aattack;
    defense = ddefense;
    name = nname;
  }  
  
  void setHp (float hhp){
    hp = hhp;
  }
  
  void setAttack (String weapon){
    if (weapon.equals("hand")) attack = 5;
    if (weapon.equals("knife")) attack = 10;
    if (weapon.equals("sword")) attack = 25;
    if (weapon.equals("lance")) attack = 25;
//    attack = aattack;
  }
  
  void setDefense (String armour){
    if (armour.equals("none")) defense = 0;
    if (armour.equals("shield")) defense = 15;
    if (armour.equals("full body")) defense = 25;
//    defense = ddefense;
  }
  
  float getHp (){
    return hp;
  }
  
  float getAttack (){
    return attack;
  }
  
  float getDefense (){
    return defense;
  }
  
  void drawMe(){
    pushMatrix();
    translate(300, 235);
    fill(0);
    noStroke();
    textAlign(LEFT);
    textSize(20);
    text(name.toUpperCase(), 0, 0);
    textSize(10);
    text("HP: ", 0, 15);
    textAlign(RIGHT);
    textSize(15);    
    text(round(hp) + "  /  " + round(maxHP),  128, 30);
    
    stroke(0);
    fill(255);
    rect(25, 8, 100, 5);
    fill(0);
    rect(25, 8, (hp/maxHP) * 100, 5);
    popMatrix(); 
  }
}


