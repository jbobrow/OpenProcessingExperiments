
/**
 * Sense App
 * 
 * My coding is a mess but my hair is perfect
 */
int endMtime;
boolean scala = true;
boolean end = false;
Record[] records;
String[] lines;
int recordCount;
int mode = 1;
PFont body;
int num = 600;
int startingEntry = 0;
  int[] pos;
  int[] shuffle;
  int[] mylines;
  int posCount = 0;
void setup() {
  size(1024,768);
  noFill();
  
  smooth();
  
  body = loadFont("Monospaced.bold-14.vlw");
  textFont(body,16);
  
  
  lines = loadStrings("keywords.tsv");
  records = new Record[lines.length];
  for (int i = 0; i < lines.length; i++) {
    String[] pieces = split(lines[i], TAB); 
      
      records[recordCount] = new Record(pieces);
      recordCount++;
    
  }
    records = (Record[]) subset(records, 0, recordCount);  
    pos = new int[recordCount*2+2];
    shuffle = new int[recordCount+2];
    mylines = new int[recordCount*4+2];
    for(int i = 0; i <recordCount*2;i++)
      pos[i] = - 500; 
    for(int i = 0; i < recordCount; i++)
      shuffle[i] = i;
    for (int i = 0; i < 30000000; ++i) {
      int j = int(random(recordCount));
      int k = int(random(recordCount));
      int temp = shuffle[j];
      shuffle[j] = shuffle[k];
      shuffle[k] = temp;
    }
}



void draw() {

  if(scala == true)
  scale(0.5);
  if(scala == false){
  if(mode == 1)
  translate(0,0);
  if(mode == 2)
  translate(-1020,0);
  if(mode == 3)
  translate(0,-708);
  if(mode == 4)
  translate(-1020,-708);
  }
  background(255);

 
  for(int i = 0; i < posCount+2; i++){
  fill(255);
  stroke(0);
  strokeWeight(14);  
  
  if(i > 0)
  
  for(int j = 0; j < posCount+2; j++){
    stroke(0);
    if(sqrt((pos[i-2] - pos[j])*(pos[i-2] - pos[j]) + (pos[i-1] - pos[j+1])*(pos[i-1] - pos[j+1]) ) < 230 && i -2 != j && i-1 != i +1 ){
     if(sqrt((pos[i-2] - pos[j])*(pos[i-2] - pos[j]) + (pos[i-1] - pos[j+1])*(pos[i-1] - pos[j+1]) ) < 200){
      if(pos[j] > pos[i-2])
      pos[j] += 3; 
      if(pos[j] < pos[i-2])
      pos[j] -= 3; 
      if(pos[j] == pos[i-2])
      pos[j] -= int(random(-2,2));
      if(pos[j+1] > pos[i-1])
      pos[j+1] += 3; 
      if(pos[j+1] < pos[i-1])
      pos[j+1] -= 3; 
      if(pos[j+1] == pos[i-1])
      pos[j+1] -= int(random(-2,2));
     }
      
      
      if(j == posCount && pos[i-2] < pos[posCount])
      pos[i-2] -= 2; 
      if(j == posCount && pos[i-2] > pos[posCount])
      pos[i-2] += 2; 
      if(j == posCount && pos[i-1] < pos[posCount+1])
      pos[i-1] -= 2; 
      if(j == posCount && pos[i-1] > pos[posCount+1])
      pos[i-1] += 2; 
      line(pos[i-2],pos[i-1],pos[j],pos[j+1]);
    }
    j+=1;  
  }
  fill(255);
 if(end == true)
 textFont(body,16);
  i++;  
  }
  for(int i = 0; i < posCount+2; i++){
    fill(255);
  stroke(0);
  strokeWeight(2);  
  if(i < recordCount*2)
  ellipse(pos[i],pos[i+1],records[shuffle[i/2]].name.length()*10+20,records[shuffle[i/2]].name.length()*10+20);
  
  fill(0);
  stroke(255);
  if(i < posCount)
  text(records[shuffle[i/2]].name, pos[i]-records[shuffle[i/2]].name.length()*5,pos[i+1]+3);
  if(i == posCount)
  text("???", pos[i]-records[shuffle[i/2]].name.length()*5,pos[i+1]+3);
  i++;  
  }
if(end == true){
textFont(body,40);
if(endMtime - second() > 0){
fill(128);
text("nothing more to be written",40,40);
}
}
}

void mousePressed() {
  if(end == false){
     pos[posCount] = mouseX*2;
     pos[posCount+1] = mouseY*2;
     posCount += 2;
   if(posCount == recordCount*2)
     end = true;
  }
    if(end == true){
      if(second() > 57)
        endMtime = 2;
      endMtime = second()+2;
    }
  } 
void mouseMoved() {
  if(end != true){
  pos[posCount] = mouseX*2;
  pos[posCount+1] = mouseY*2;
  }
}
void keyPressed(){
  if(key == ' ')
    scala = true;
  if(key == '1'){
    mode = 1;
    scala = false;
  }
  if(key == '2'){
    mode = 2;
    scala = false;
  }
  if(key == '3'){
    mode = 3;
    scala = false;
  }
  if(key == '4'){
    mode = 4;
    scala = false;
  }
  
  

}


