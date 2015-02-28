
int counter;
TActive t231;
TPassive t440;
LayoutManager lm;

void setup() {  //setup function called initially, only once
  size(600, 400);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  lm = new LayoutManager();
  testScenario();  
}


void testScenario() {
  println("--START scenario--");
  // Setup the basic accounts;
  t231 = new TActive(lm.leftX(),lm.leftY(), "Machines");
  t440 = new TPassive(lm.rightX(), lm.leftY(), "Fournisseurs");
  
  //Mouvement.de(t231).vers(t440).duMontant(300);  
  
  println(Mouvement.de(t231));
  println(Mouvement.de(t231).vers(t440));
  println(Mouvement.de(t231).vers(t440).duMontant(330));
  println("--END--");
  println();

  
 /*
  t= new T(x,y,"Message");
  t.addDebit();
  t.addCredit();
  // TODO: T could have a well known color to say if it's debit or credit
  t.moveAmountTo(amount, T from, T to);
  */
  
  
}

class Mouvement {

    Mouvement(T compte) {
        this.deCompte=compte;
    } 

    static Mouvement de(T compte) {
        return new Mouvement(compte);
    }
    
    Mouvement vers(T compte) {
        this.versCompte=compte;
        return this;
    }
    
    Mouvement duMontant(montant) {
        this.montant=montant;
        return this;
    }
    
    String toString () {
        return "Mouvement de "+ this.deCompte  +" vers " + this.versCompte 
        + " d'un montant de " + this.montant + " euros.";
    }

}


/**
LayoutManager ensures the account do not collapse and pile correctly.
There are two columns. Left is for active and right is for passive.
*/
class LayoutManager {
    LayoutManager() {
        this.leftColumnX=150;
        this.rightColumnX=300;
        this.leftColumnY=0;
        this.rightColumnY=0;
    }
    
    int leftY() {
        return this.leftColumnY=this.leftColumnY+100;
    }
    
    int rightY() {
        return this.rightColumnY=this.rightColumnY+100;
    }
    
    int leftX() {
        return this.leftColumnX;
    }
    
    int rightX() {
        return this.rightColumnX;
    }
    
    
  
}


class T {
    T(x,y,accountName,active) {
        this.x=x;
        this.y=y;
        this.accountName=accountName;
        this.active=active;
        tLine();
    }
    
    void setActive() {
        this.active=true;
    }
    
    void setPassive() {
        this.active=false;
    }
    
    boolean getActive() {
        return this.active;
    }
    
    boolean getPassive() {
        return (this.active==false);
    }
    
    void addDebit() {
        
    }
    
    void tLine() {
      line(this.x-50,this.y,this.x+50,this.y);
      line(this.x,this.y,this.x,this.y+50);
      textAt(this.x, this.y, this.accountName);
    }

 void textAt(x,y, txt) {
        print("test");
        PFont font;
        font = loadFont("FFScala.ttf"); 
        textFont(font); 
        textAlign(CENTER);
        // TODO: avoir une identité visuelle
        if (this.getActive()) {
            fill(100,200,100);
        } else {
            fill(200,100,00);
        }
        text(txt, x, y); 
    }
    
    String toString() {
        return "compte '" + this.accountName+ "'"; 
    }
   
}

class TActive extends T {
    TActive(x,y,accountName) {
        super(x,y,accountName,true);
    }    
}

class TPassive extends T {
    TPassive(x,y,accountName) {
        super(x,y,accountName, false);
    }    
}

void draw() {  //draw function loops   
}

void mouseClicked() {
      counter++;
      if (counter%2==0) {
          new TPassive(mouseX,mouseY,"Test P");
      } else {
          new TActive(mouseX,mouseY,"Test A");
      }
}

// Utilities
