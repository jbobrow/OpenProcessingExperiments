
String input;
String[] lines;

void setup() {
  size(200,230);
  lines = loadStrings("http://companje.nl/processing/assets/netnummers.txt");
  input = "";
  background(0);
  textSize(30);
  smooth();
  strokeWeight(2);
}

void draw() {
  fill(0,255);
  noStroke();
  rect(0,0,width,height);


  for (int i=0; i<lines.length; i++) {
    String[] nums = split(lines[i],"\t");

    float x = map(int(nums[1]),1326,15150,0,width);
    float y = map(int(nums[0]),0,9834,height,0);

    if (input.equals("") || nums[2].indexOf(input, 0)==0) {
      stroke(255,255,0);
    } else {
      stroke(128);
    }
    point(x,y);
  }

  fill(255);
  text(input,20,40);
}

void keyPressed() {
  if (key<='9' && key>='0' && input.length()<4) input+=key;
  if (key==8 && input.length()>0) input=input.substring(0,input.length()-1);
}




