
import java.util.Arrays;
Jam jam = new Jam();
Jam jam2 = new Jam();
void setup(){
  size(600,600);
  jam.addButton(50,50,"swahi","button1",60);
  jam.addButton(50,200,"swahi", "button2",40);
  jam.addButton(50,400,"the lonely one","button3",300,175,30);
  jam2.addButton(400,50,"press me","button4",100);
  jam.setLookAndFeel(jam.FUTURISTIC);
  jam2.setLookAndFeel(jam.MECHANICAL);
}
void draw(){
  background(200);
  jam.updateEx(new String[]{"button3"});
  jam2.update();
  if(jam2.isPressed("button4")){
  jam.update("button3");
  }
}
void mouseClicked(){
  if(jam.isPressed("button1")){
    println("button1 clicked");
  }
}
public class Jam{
Integer FUTURISTIC = 0;
Integer MECHANICAL = 1;
Integer PROCESSING = 2;
Integer lookandfeel = 0;
ArrayList<button> buttons = new ArrayList<button>();

public Jam(){
  
}

void update(){
  for(int i = 0; i < buttons.size(); i ++){
    buttons.get(i).drawButton();
  }
}

void update(String name){
  buttons.get(buttons.indexOf(getButton(name))).drawButton();
}

void updateEx(String names[]){
  for(int i = 0; i < buttons.size(); i ++){
    if(!Arrays.asList(names).contains(buttons.get(i).name)){
    buttons.get(i).drawButton();
    }
  }
}

void setLookAndFeel(int laf){
  lookandfeel = laf;
}

boolean isPressed(String name){
  if(getButton(name).mouse == 1){
      return true;
  }
  return false;
}

void changeX(String name, int x){
  getButton(name).x+=x;
}

void addButton(float xI, float yI, String textI, String nameI, float widthI, float heightI, int textSizeI){
  buttons.add(new button(xI, yI, textI, nameI, widthI, heightI, textSizeI));
}
void addButton(float xI, float yI, String textI, String nameI, int textSizeI){
  buttons.add(new button(xI, yI, textI, nameI, textSizeI));
}
button getButton(String name){
  for(int i = 0; i < buttons.size(); i ++){
    if(buttons.get(i).name.equals(name)){
      return buttons.get(i);
    }
  }
  return null;
}
class button{
  private float x;
  private float y;
  private String text;
  private String name;
  private float Bwidth;
  private float Bheight;
  private int textSize;
  private int mouse = 0;
  private int type;
  public button(float xI, float yI, String textI, String nameI, int textSizeI){
    type = 0;
    textSize(textSizeI);
    x = xI;
    y = yI;
    text = textI;
    name = nameI;
    float offset = min(textWidth(textI), (textAscent()+textDescent()));
    Bwidth = textWidth(textI)+ offset/5;
    Bheight = (textAscent()+textDescent()) + offset/5;
    textSize = textSizeI;
  }
  public button(float xI, float yI, String textI, String nameI, float widthI, float heightI, int textSizeI){
    type = 1;
    x = xI;
    y = yI;
    text = textI;
    name = nameI;
    Bwidth = widthI;
    Bheight = heightI;
    textSize = textSizeI;
  }
  public void drawButton(){
    this.update();
    if(lookandfeel == FUTURISTIC){
      stroke(0);
      strokeWeight(3);
      if(mouse == 0){
        fill(200,200,200,200);
      }else if(mouse == 2){
        fill(150,150,150,200);
      }else if(mouse == 1){
        fill(75,75,75);
      }
      rect(x, y, Bwidth, Bheight, min(Bwidth/10,Bheight/10));
      fill(0);
      float offset = min(Bwidth/10,Bheight/10);
      textSize(textSize);
      if(type == 0){
      text(text,x+(Bwidth-textWidth(text))/2,y+(Bheight-(textAscent()+textDescent()))/2+(textAscent()+textDescent())-offset);
      }else{
        text(text,x+(Bwidth-textWidth(text))/2,y+(Bheight-(textAscent()+textDescent()))/2+(textAscent()+textDescent())); 
      }
    }
    if(lookandfeel == MECHANICAL){
      noStroke();
      float offset = min(Bwidth/10,Bheight/10);
      if(mouse == 0){
        fill(50,50,50);
        rect(x,y,Bwidth, Bheight);
        fill(255,255,255);
        rect(x,y,Bwidth-offset/2,Bheight-offset/2);
        fill(150,150,150);
        rect(x+offset/2, y+offset/2, Bwidth-offset, Bheight-offset);
      }
      if(mouse == 1){
        fill(225);
        rect(x,y,Bwidth, Bheight);
        fill(25);
        rect(x,y,Bwidth-offset/2,Bheight-offset/2);
        fill(75);
        rect(x+offset/2, y+offset/2, Bwidth-offset, Bheight-offset);
      }
      if(mouse == 2){
        fill(50,50,50);
        rect(x,y,Bwidth, Bheight);
        fill(255,255,255);
        rect(x,y,Bwidth-offset/2,Bheight-offset/2);
        fill(100);
        rect(x+offset/2, y+offset/2, Bwidth-offset, Bheight-offset);        
      }
      fill(0);
      textSize(textSize);
      if(type == 0){
      text(text,x+(Bwidth-textWidth(text))/2,y+(Bheight-(textAscent()+textDescent()))/2+(textAscent()+textDescent())-offset);
      }else{
        text(text,x+(Bwidth-textWidth(text))/2,y+(Bheight-(textAscent()+textDescent()))/2+(textAscent()+textDescent())); 
      }
    }
  }
  public void update(){
    if(mouseX > x && mouseX < x+Bwidth && mouseY > y && mouseY < y+Bheight){
      if(mousePressed){
        mouse = 1;
      }else{
        mouse = 2;
      }
    }else{
      mouse = 0;
    }
  }
}
}
