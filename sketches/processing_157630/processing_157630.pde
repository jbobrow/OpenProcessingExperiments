
String [] lines;
String nop = "/wrdprss_minsal/wp-content/uploads/2014/05/noalerta.png";

int count = 0;

void setup(){
  size(640, 480);
  lines = loadStrings("http://www.seremisaludmaule.cl/");
  println(lines.length);
  for(int i = 0; i < lines.length; i++){
    if(lines[i].indexOf(nop) != -1){
      count++;
    }
  }
  
  background(255);
  noStroke();
  textAlign(CENTER, CENTER);
  textSize(30);
  if(count > 0){
    fill(#149024);
    ellipse(width/2, height/2, 300, 300);
    fill(255);
    text("No hay restricción", width/2, height/2);
  }else{
    fill(#D60F12);
    ellipse(width/2, height/2, 300, 300);
    fill(255);
    text("Hay restricción", width/2, height/2);
  }
  fill(0);
  textAlign(LEFT);
  textSize(20);
  text("(Según: http://www.seremisaludmaule.cl/)", 30, height-30);
}

void draw(){
  
}
