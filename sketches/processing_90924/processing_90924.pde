
// init classes
  MainView main;

// init variables
  XML xml;
  ArrayList<Entry> ny = new ArrayList<Entry>();
  ArrayList<Entry> sac = new ArrayList<Entry>();
  ArrayList<Entry> sf = new ArrayList<Entry>();
  PImage cart;
  PFont lg, fb, di, db, ob;
  String econStr = "craigslist economy";
  String ovStr = "for sale listing";
  Button ovBttn, econBttn;
  Button currentBttn;

void setup() {
  size(1000,600);
  cart = loadImage("cart2.png");
  lg = loadFont("LeagueGothic.vlw");
  fb = loadFont("FranchiseBold.vlw");
  di = loadFont("Dillenia.vlw");
  db = loadFont("DilleniaBold.vlw");
  ob = loadFont("OstrichSansBold.vlw");
  buttonSetup();
  data();
}

void update(){
  // ovBttn.mousePressed();
  // econBttn.mousePressed();
  if( main != null ){ main.update(); }
}

void draw(){
  update();
  clearScreen();
  drawUI();
  if( main != null ){ main.draw(); }
}

void clearScreen(){
  background(255);
}

void drawUI(){
  headline();
  leftMenu();
  ovBttn.mouseHandler();
  econBttn.mouseHandler();
}

// top: 70, left: 0, right: 150, bottom: height-25
void leftMenu(){
  // visualize menu line
  stroke(219, 205, 166);
  line(150, 70, 150, height-25);
  econBttn.draw();
  ovBttn.draw();
}

void buttonSetup(){
  // create buttons
  ovBttn = new Button(75, height/2-50,  ovStr, 0);
  econBttn = new Button(75, height/2-50, econStr, 1);
  currentBttn = new Button();
  
  // set button handlers
  ovBttn.setEventHandler(new ButtonHandler(){
      public void buttonPressed(){
        main = null;
      }
      public void buttonOver(){
        noFill();
        stroke( #E2931B );
        rectMode(CENTER);
        rect(75, height/2-55, ovBttn.w+30, 18, 5);
      }
    });

  econBttn.setEventHandler(new ButtonHandler(){
      public void buttonPressed(){
        main = new MapEconomy();
      }
      public void buttonOver(){
        noFill();
        stroke( #2BD2D2 );
        rectMode(CENTER);
        rect(75, height/2-25, econBttn.w+30, 18, 5);
      }
    });
}

// top: 0, bottom: 40
void headline(){
  noStroke();
  rectMode(CORNERS); fill(27,26,26); rect(0,0,width,40);
  imageMode(CENTER); image(cart, 20, 20, 30, 30);
  textFont(lg, 23); fill(240); textAlign(LEFT); text("CRAIGSLIST", 40, 28);
  textFont(lg, 23); textAlign(RIGHT); text("VIS - SO CHOI", width-10, 28);
}

void data(){
  XML[] rows = loadXML("craigslist7.xml").getChildren("row");
  row: 
    for(int i = 0; i < rows.length; i++){
      XML[] fieldname = rows[i].getChildren("field");
      String id = "", price = "", date = "", loc = "",
              subcategory = "", subdomain = "", area = "";    
      for(int j = 0; j < fieldname.length; j++){
        String attributes = fieldname[j].getString("name");
        String content = fieldname[j].getContent();
        if(attributes.equals("price")){
          if(parseInt(content) <= 5 || parseInt(content) > 50000){  continue row;  }
          else price = fieldname[j].getContent();
        }
        else if(attributes.equals("id")){ id = content; }
        else if(attributes.equals("subcategory")){ subcategory = content; }
        else if(attributes.equals("location")){ loc = content; }
        else if(attributes.equals("date")){ date = content; }
        else if(attributes.equals("subdomain")){ subdomain = content; }
        else if(attributes.equals("area")){ area = content; }
      }
      Entry post = new Entry(id, subcategory, price, loc, date, subdomain, area);
      if(post.subdomain.equals("newyork")){ ny.add(post); }
      else if(post.subdomain.equals("sacramento")){ sac.add(post); }
      else if(post.subdomain.equals("sfbay")){ sf.add(post); }
    }
}
public interface ButtonHandler{
	public void buttonPressed();
	public void buttonOver();
};

public class Button{
	String content = "";
	String type = "";
	int x = 75;
	int y = height/2-50;
	Integer value = 0;
	float w;
	float h = 20;
	float innerRadius;
	float notOuterRadius; // diameter for arc.
	float lowerAngle;
	float upperAngle;
	int r = 51;
	int g = 53;
	int b = 55;
	public ButtonHandler bh;
	boolean clicking = false;

	// default button
	public Button(){}

	// circular buttons
	public Button(int x, int y, float diameter, int r, int g, int b, String content){
		this.x = x;		this.y = y;		// set location
		this.w = diameter;		this.h = w;		// set diameter
		this.r = r;		this.g = g;		this.b = b; 	// set fill color
		this.content = content;	// set content
		this.type = "circle";
	}

	// menu buttons
	public Button(int x, int y, String content, int index){
		this.x = x;
		this.y = y+30*index;
		this.content = content;
		// this.w = 70;
		this.w = textWidth(content);
		this.type = "menu";
	}

	// arc buttons
	public Button(int x, int y, float innerRadius, float notOuterRadius, float lowerAngle, float upperAngle, String content, Integer value){
		this.x = x;
		this.y = y;
		this.innerRadius = innerRadius;
		this.notOuterRadius = notOuterRadius;
		this.lowerAngle = lowerAngle;
		this.upperAngle = upperAngle;
		this.content = content;
		this.value = value;
		this.type = "arc";
	}

	public void draw(){
		if( type.equals("menu") ){
			noStroke();
			fill(r, g, b);
			textFont(di, 24); textAlign(CENTER);
			text(content, x, y);
		}
		else if( type.equals("circle") ){
			noStroke();
			fill(r, g, b);
			ellipse(x, y, w, w);
			fill(255);
			textFont(fb, 18); textAlign(CENTER);
			text(content, x, y+5);
		}
		else if( type.equals("arc") ){
			arc(x, y, notOuterRadius, notOuterRadius, lowerAngle, upperAngle);
		}
	}

	public void setEventHandler(ButtonHandler bh){
		this.bh = bh;
	}

	// void mousePressed(){
	// 	if( !type.equals("arc") ){
	// 		if( mousePressed && mouseX >= x - w/2 && mouseX <= x + w/2 &&
	// 			mouseY >= y - h/2 && mouseY <= y + h/2 ){
	// 	    	bh.buttonPressed();
	// 	    }			
	// 	}
	// 	else{
	// 		float distance = dist(mouseX, mouseY, x, y);
	// 		float yDist = mouseY-y;
	// 		float xDist = mouseX-x;
	// 		float currAngle = atan2(yDist, xDist);
	// 		if( currAngle < 0 ){ currAngle += TWO_PI; }
	// 		if( mousePressed && distance <= notOuterRadius/2 && distance >= innerRadius ){
	// 			if( currAngle > lowerAngle && currAngle < upperAngle ){
	// 				bh.buttonPressed();
	// 			}
	// 		}
	// 	}
	// }

	void mouseHandler(){
		if( !type.equals("arc") ){
			if( mouseX >= x - w/2 && mouseX <= x + w/2 &&
		      mouseY >= y - h/2 && mouseY <= y + h/2 ){
			    bh.buttonOver();
			    if( mousePressed && !clicking ){
			    	clicking = true;
			    	bh.buttonPressed();
			    }
			    else if( !mousePressed && clicking ){
			    	clicking = false;
			    }
			}
		}
		else{
			float distance = dist(mouseX, mouseY, x, y);
			float yDist = mouseY-y;
			float xDist = mouseX-x;
			float currAngle = atan2(yDist, xDist);
			if( currAngle < 0 ){ currAngle += TWO_PI; }
			if( distance <= notOuterRadius/2 && distance >= innerRadius ){
				if( currAngle > lowerAngle && currAngle < upperAngle ){
					currentBttn = this;
					bh.buttonOver();
					if( mousePressed && !clicking ){
						clicking = true;
						bh.buttonPressed();
					}
					else if( !mousePressed && clicking){
						clicking = false;
					}
				}
			}
		}
	}
}
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;

class Entry {
  int id; // id of posting
  int price; // Price for posting
  String loc;
  String subcategory;
  String subdomain;
  String area; // Name of area from subdomain: manhattan, westchester, etc.
  Date date;

  Entry(String id, String subcategory, String price, String loc, String date, String subdomain, String area) {
    this.id = Integer.parseInt(id);
    this.subcategory = subcategory;
    this.price = Integer.parseInt(price);
    this.loc = loc;
    this.subdomain = subdomain;
    this.area = area;
    
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    try{
      this.date = df.parse(date);
    }catch(ParseException e){
      println(e);
    }
  }
  
  public String toString(){
    return "Entry: On " + this.date + ", " + this.id + ", $" + this.price + " \n "
            + "at " + this.area + "," + this.subdomain + "\n";
  }
}
abstract class MainView{
	abstract void draw();
	abstract void update();
}
class MapEconomy extends MainView{
	PImage usa;
	// float inc = 0;
	float diameter = 0;
	int index = 0;
	int w = 0;
	int h = 0;
	Button nyBttn, sacBttn, sfBttn;
	String nyStr, sacStr, sfStr;

	MapEconomy(){
		loadMap();
		buttonSetup();
	}

	void update(){
		// nyBttn.mousePressed();
		// sacBttn.mousePressed();
		// sfBttn.mousePressed();
	}

	void draw(){
		drawMap();
		drawButtons();
		nyBttn.mouseHandler();
		sacBttn.mouseHandler();
		sfBttn.mouseHandler();
	}

	void loadMap(){
		usa = loadImage("usa.png");
	}
	void drawMap(){
		imageMode(CENTER);
		image(usa, width/2+80, height/2+30);
		
		fill(0);
		textFont(lg, 23); textAlign(RIGHT);
		text("SUBDOMAIN ECONOMY", width-10, 40+50);
	}

	void buttonSetup(){
		w = width-200;
		h = 230;
		diameter = 30;
		nyBttn = new Button(w, h, diameter, 171, 80, 38, new String("ny"));
		nyBttn.setEventHandler(new ButtonHandler(){
			public void buttonPressed(){
				main = new SubdomainView(ny);
			}
			public void buttonOver(){
				fill(255);
				stroke( nyBttn.r, nyBttn.g, nyBttn.b );
				rectMode(CENTER);
				ellipse( nyBttn.x , nyBttn.y, nyBttn.w, nyBttn.w );
				fill(0);
				textFont(fb, 18); textAlign(CENTER);
				text( nyBttn.content, nyBttn.x, nyBttn.y+5 );

				textFont(fb, 24); textAlign(CENTER);
				text(calcEconomy(ny), width/2+80, height/2+30);
			}
			});
		
		w = 150+170;
		h = height/2;
		diameter = 30;
		sacBttn = new Button(w, h, diameter, 158, 50, 158, new String("sac"));
		sacBttn.setEventHandler(new ButtonHandler(){
			public void buttonPressed(){
				main = new SubdomainView(sac);
			}
			public void buttonOver(){
				fill(255);
				stroke( sacBttn.r, sacBttn.g, sacBttn.b );
				rectMode(CENTER);
				ellipse( sacBttn.x , sacBttn.y, sacBttn.w, sacBttn.w );
				fill(0);
				textFont(fb, 18); textAlign(CENTER);
				text( sacBttn.content, sacBttn.x, sacBttn.y+5 );

				textFont(fb, 24); textAlign(CENTER);
				text(calcEconomy(sac), width/2+80, height/2+30);
			}
			});

		w = 150+149;
		h = height/2+24;
		diameter = 30;
		sfBttn = new Button(w, h, diameter, 131, 170, 59, new String("sf"));
		sfBttn.setEventHandler(new ButtonHandler(){
			public void buttonPressed(){
				main = new SubdomainView(sf);
			}
			public void buttonOver(){
				fill(255);
				stroke( sfBttn.r, sfBttn.g, sfBttn.b );
				rectMode(CENTER);
				ellipse( sfBttn.x , sfBttn.y, sfBttn.w, sfBttn.w );
				fill(0);
				textFont(fb, 18); textAlign(CENTER);
				text( sfBttn.content, sfBttn.x, sfBttn.y+5 );

				textFont(fb, 24); textAlign(CENTER);
				text(calcEconomy(sf), width/2+80, height/2+30);
			}
			});
	}
	void drawButtons(){
		nyBttn.draw();
		sacBttn.draw();
		sfBttn.draw();
	}

	String calcEconomy(ArrayList<Entry> sd){
		int sum = 0;
		for( Entry a : sd ){
			sum += a.price;
		}
		
		return new String("$" + sum);
		// w = wx;
		// h = hy;
		// if( index == subd.size() ) exit();
		// inc = subd.get(index).price;
		// index++;
		// diameter += pow( inc , 0.2 );
		// if( index % 50 == 0 ){  }
		// noFill();
		// stroke(r,g,b);
		// ellipse(w, h, diameter, diameter);
	}
}
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.lang.String;
import java.awt.Color;

class SubdomainView extends MainView{
	ArrayList<Entry> sd; 		// 	arraylist of subdomain entries
	ArrayList<Button> arcs;		//	arraylist of arcs
	ArrayList<Button> clickedBttns;
	Map<String, Integer> cats; 	// 	<subcategory name, number of posts>. used for calculation
	float[] randomColor;
	color[] colorPalette = new color[100];
	float outerRadius, innerRadius;
	float arcAngle;

	SubdomainView(ArrayList<Entry> sd){
		this.sd = sd;
		palette();
		calculate();
		makeArcs();
	}

	color randomColorGenerator(){
		randomColor = new float[3];
		randomColor[0] = random(0, 255);
		randomColor[1] = random(0, 255);
		randomColor[2] = random(0, 255);
		return color(randomColor[0], randomColor[1], randomColor[2]);
	}

	void palette(){
		for( int i = 0; i < 100; i++ ){
			colorPalette[i] = randomColorGenerator();
		}
	}

	void update(){
	}

	void draw(){
		drawCategories();
		drawCenterLabel();
		arcOver();
		showDetailed();
	}

	// draws arcs (which are subcategories)
	void drawCategories(){
		stroke(0);
		
		int i = 0;
		for( Button a : arcs ) {
			fill(colorPalette[i]);
			a.draw();
			i++;
		}

		// inner arc (empty)
		fill(255);
		stroke(0);
		ellipse(width/3+20, height/2+30, 100, 100);

		fill(0);
		textFont(lg, 23); textAlign(RIGHT);
		text(sd.get(0).subdomain.toUpperCase() + " POST COUNT - SUBCATEGORY", width-10, 40+50);
	}

	// draws the center of the circle and labels the total post count
	void drawCenterLabel(){
		fill(0);
		ellipse(width/3+20, height/2+30, 40, 40);
		fill(255);
		textFont(lg, 14); textAlign(CENTER);
		text(new String(sd.size()+""), width/3+20, height/2+34);
	}

	// mouseover handler for all the arcs
	void arcOver(){
		for( Button a : arcs ){
			a.mouseHandler();
		}
	}

	// calculate total number of posts per subcategory
	void calculate(){
		cats = new HashMap<String, Integer>();
		for( Entry a : sd ){
			if( !cats.containsKey(a.subcategory) ){
				cats.put( a.subcategory, 1 );
			}
			else{
				cats.put( a.subcategory, Integer.valueOf(cats.get(a.subcategory))+1 );
			}
		}
	}

	public void showDetailed(){
		if( !clickedBttns.isEmpty() ){
			for( int i = 0; i < clickedBttns.size(); i++ ){
				fill(0);
				clickedBttns.get(i).draw();

				fill(30);
				textFont(lg, 20); textAlign(RIGHT);
				text(clickedBttns.get(i).content.toUpperCase(), width-10, 40+50*(i+2));
				text(clickedBttns.get(i).value + " POSTS", width-10, 40+50*(i+2)+20);
			}
		}
	}

	// generates all the arcs
	void makeArcs(){
		arcAngle = TWO_PI/cats.size();
		arcs = new ArrayList<Button>();
		clickedBttns = new ArrayList<Button>();

		float extraRadius;
		int i = 0;
		for( String a : cats.keySet() ) {
			Integer value = cats.get(a);
			extraRadius = pow( value, 0.71 );
			arcs.add(new Button(width/3+20, height/2+30, 50, 200+extraRadius, arcAngle*i, arcAngle*(i+1), a, value));
			arcs.get(i).setEventHandler(new ButtonHandler(){
				public void buttonPressed(){
					if( !clickedBttns.contains(currentBttn) ){
						clickedBttns.add(currentBttn);
					}
					else if( clickedBttns.contains(currentBttn) ){
						clickedBttns.remove(currentBttn);
					}
				}
				public void buttonOver(){
					fill(0);
					currentBttn.draw();

					fill(30);
					textFont(lg, 20); textAlign(RIGHT);
					text(currentBttn.content.toUpperCase(), width/1.5, 40+50*2);
					text(currentBttn.value + " POSTS", width/1.5, 40+50*2+20);
				}
				});
			i++;
		}
	}
}


