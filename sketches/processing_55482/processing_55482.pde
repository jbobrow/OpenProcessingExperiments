
// Class: TextObj
public class TextObj {
  int x,y,time, myheight;
  boolean addL;
  String display;
  String t;
  
  public TextObj(String t, int x, int y) {
    this.addL = true;
    this.t = t;
    this.x = x;
    this.y = y;
    this.time = 0;
    this.display = "";
    this.myheight = 17*floor((textWidth(this.t))/( width - this.x - 20 ))+14;
  }
  
  public void drawSelf() {
    this.drawSelf("");
  }
  
  public void drawSelf(String extra) {
    if(this.addL) {
      if(this.time != -1 && this.time < this.t.length()) {
        this.display += this.t.charAt(this.time);
        this.time++;
      } else {
        this.time = -1;
      }
    }
    this.addL = !this.addL;
    text(this.display + extra, this.x, this.y, width-this.x-20, this.myheight);
  }
}

// Class: AI
public class AI {
  LinkedList L;
  TextObj prompt;
  boolean shifting, cursorOn;
  int shiftValue;
  
  public AI() {
    this.shifting = false;
    this.cursorOn = true;
    this.shiftValue = 0;
    this.prompt = new TextObj("",20,20);
    this.L = new LinkedList();
  }
  
  public void newPrompt(String t) {
    this.L.add(this.prompt);
    TextObj tempto = new TextObj(t,20,20);
    if(this.prompt.y + tempto.myheight + 14 > height-10) {
      this.shifting = true;
      this.prompt = new TextObj(t,20,this.prompt.y - tempto.myheight);
    } else {
      this.prompt = new TextObj(t,20,this.prompt.y+this.prompt.myheight);
    }
  }
  
  public void drawSelf() {
    fill(100);
    for(int i=0; i < L.size(); i++) {
      TextObj T = (TextObj)L.get(i);
      if(T.y < 34) { L.remove(T); break; }
    }
    
    for(int i=0; i < L.size(); i++) {
      TextObj T = (TextObj)L.get(i);
      T.drawSelf();
    }
    
    if(!this.shifting) {
      fill(220);
      if(frameCount%16 == 0 && this.prompt.time == -1) {
        this.cursorOn = !this.cursorOn;
      }
      
      if(this.cursorOn || this.prompt.time != -1) {
        this.prompt.drawSelf("_");
      } else {
        this.prompt.drawSelf();
      }
    } else {
      if(this.shiftValue >= this.prompt.myheight + 14) {
        this.shifting = false;
        this.shiftValue = 0;
      }
      this.shiftUp();
    }
  }
  
  private void shiftUp() {
      for(int i=0; i < this.L.size(); i++) {
        TextObj T = (TextObj)L.get(i);
        T.y -= 1;
      }
      this.shiftValue++;
  }
}

