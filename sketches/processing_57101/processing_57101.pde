
CAutomata ca;
PFont font;

int [] trules =new int[8];

void setup() {
  size(300, 300);
  ca=new CAutomata();
  ca.ruleset();
  ca.generate();
  //font
  //1.change font color
  //2.Display rule array

  font = loadFont("ArialMT-10.vlw");
  textFont(font,10);
}

void draw() {
  ca.render();
  fill(255);
  text("Rule:",width-105,height-10);
  for (int i=0;i<trules.length;i++){
    text(trules[i],width-(20+(i*8)),height-10);
  }
  noLoop();
}

void mouseReleased(){
  setup();
  loop();  
}

class CAutomata {
  
  int [] cells;
  int [] tempcells;
  int [] rules;

  //constructor
  CAutomata() {
    cells = new int[width];
    tempcells = new int[width];
    rules = new int [8];
  }
  
  //randomize rules
  void ruleset(){
    for(int i=0;i<rules.length;i++){ 
      rules[i]=((int)(random(2)));
      trules [i]= rules[i];
    }  
  }
    
    
    
  //initial cell configuration
  void generate() {
    for (int i=0;i<cells.length;i++) {
      cells[i]=0;
      cells[cells.length/2]=1;
    }
  }

  //generation of cells
  void render() {
    //processing xy grid
    for (int py=0;py<height;py++) { 
      for (int px=1;px<width-1;px++) {
        tempcells[px]= rules(cells[px-1], cells[px], cells[px+1]);
        point(px, py+1);
        
        //draw containercells in next line
        if (tempcells[px]==1) {
          stroke(0);
        }else {
          stroke(255);
        }
      }
      //counter to pass value of tempcells to cells
      for (int j=1;j<cells.length-1;j++) {
        cells[j]=tempcells[j]; 
      }
      fill(0);
      noStroke();
      rect(width-105,height-18,92,10);
    }
  }
  
  //rules
  int rules (int a, int b, int c) {
    if (a == 1 && b == 1 && c == 1) return rules[0];
    if (a == 1 && b == 1 && c == 0) return rules[1];
    if (a == 1 && b == 0 && c == 1) return rules[2];
    if (a == 1 && b == 0 && c == 0) return rules[3];
    if (a == 0 && b == 1 && c == 1) return rules[4];
    if (a == 0 && b == 1 && c == 0) return rules[5];
    if (a == 0 && b == 0 && c == 1) return rules[6];
    if (a == 0 && b == 0 && c == 0) return rules[7];
    else
    return 0;
  }

}




