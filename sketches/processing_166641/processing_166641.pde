
//betterlifeindex - visualized
//v0.1
//Kenneth de Brabander
//data from http://stats.oecd.org/Index.aspx?DataSetCode=BLI

//import processing.pdf.*;
Table table;
int i = 0;
int opacity = 255;
int selector = 21;
int squares = 5;
//int size = table.rows();

String[] country = new String[36*2];
int[] lifeexp = new int[36*2];
Float[] murder = new Float[36*2];
int[] assault = new int[36*2];

int[] waterqual = new int[36*2];
int[] airpol =new int[36*2];

int[] employment= new int[36*2];
int[] job= new int[36*2];

int[] perstime = new int[36*2];

int padding= 50;

//scale life exp

void setup() {
  size(800, 800);
  //size(800,800,PDF, "X:/temppro/gen/"+ selector +".pdf");
  background(255, 230, 207);

  table = loadTable("data.csv", "header");

  //for(int i = 0; i < table.rows();i++){
  for (TableRow row : table.rows ()) {

    //println(row.getString("Country"));
    String Country =row.getString("Country");
    int lifeexp1 =row.getInt("Life expectancy");
    float murder1 =row.getFloat("Homicide rate");
    int assault1 =row.getInt("Assault rate");
    int waterqual1=row.getInt("Water quality");
    int airpol1 = row.getInt("Air pollution");
    int employment1 = row.getInt("Employment rate");
    int job1 = row.getInt("Job security");
    int pers1 = row.getInt("Time devoted to leisure and personal care");


    country[i]=Country;
    lifeexp[i]=lifeexp1;
    murder[i]=murder1;
    assault[i]=assault1;
    waterqual[i] = waterqual1 *2;
    airpol[i]=airpol1 * 2;
    
    employment[i]=employment1*3;
    job[i] = job1*10;
    perstime[i] = pers1*7;


    //println(country[i] +" " +  lifeexp[i] + " " + murder[i]);

    i++;
  }


  String countrystring = country[selector];
  int pos = (width-(padding*2))/squares;
  println(pos);
  int lifevar = lifeexp[selector];
  int lifeheight = height/2;
  int murderval = int(murder[selector]*10);
  int assaultval = assault[selector]*10;
  int tri1 = 100;
  int tri2= 300;

  noStroke();
  fill(34, 120, 141, opacity);
  //triangle(pos, lifeheight, width/2, lifeheight-lifevar, pos*5, lifeheight);
  ellipse(width/2, lifeheight, lifevar*5,lifevar*5);
  fill(255, 230, 207,opacity);
  rect(0,lifeheight,width,500);
  //triangle(pos, lifeheight, width/2, (height/2)+lifevar/2, pos*4, lifeheight);

  //stroke(255);
  line(0, lifeheight, width, lifeheight);
  noStroke();


  //violencetriangle

    fill(179, 0, 40, opacity);

  triangle(pos-(murderval/2), lifeheight, pos+ (murderval/4), (lifeheight)-(assaultval), pos+(murderval/2), lifeheight);
  //triangle(pos-(murderval/2), lifeheight, pos+ (murderval/4), (lifeheight)+(assaultval), pos+(murderval/2), lifeheight);

  //violence label  
  fill(0, 255);
  //text("violence",padding+(murderval/2), (lifeheight)+(assaultval/2) );


  //waterquality & Air
  //width of tri = waterqual
  //height is air pollution
  fill(255, opacity);
  triangle(pos*2- (waterqual[selector]/2), lifeheight, pos*2 + (waterqual[selector]/4), (lifeheight)-(airpol[selector]), pos*2+(waterqual[selector]/2), lifeheight);
  //triangle(pos*2- (waterqual[selector]/2), lifeheight, pos*2 + (waterqual[selector]/4), (lifeheight)+(airpol[selector]), pos*2+(waterqual[selector]/2), lifeheight);
  //violence label  
  //fill(0, 255);
  //text("air",padding+(murderval/2), (lifeheight)-(assaultval/2) );

  //work

  fill(78, 60, 53, opacity);
  triangle(pos*3- (job[selector]), lifeheight, pos*3 - (job[selector]/4), (lifeheight)-(employment[selector]), pos*3+(job[selector]), lifeheight);
  //triangle(pos*3- (waterqual[selector]/2), lifeh eight, pos*3 - (waterqual[selector]/4), (lifeheight)+(airpol[selector]), pos*3+(waterqual[selector]/2), lifeheight);
  //violence label  
  // fill(0, 255);
  //text("air",padding+(murderval/2), (lifeheight)-(assaultval/2) );


  //quality of life

  fill(244, 128, 21, opacity);
  triangle(pos*4- (perstime[selector]), lifeheight, pos*4-(perstime[selector]/4), (lifeheight)-(perstime[selector]), pos*4+(perstime[selector]), lifeheight);
  //triangle(pos*4- (waterqual[selector]/2), lifeheight, pos*4-(waterqual[selector]/4), (lifeheight)+(airpol[selector]), pos*4+(waterqual[selector]/2), lifeheight);
  //violence label  
  fill(0, 255);
  //text("air",padding+(murderval/2), (lifeheight)-(assaultval/2) );

  fill(0, 255);
  println(countrystring);
  text(countrystring, width/2, height-height/8 );
  //exit();
}

void draw() {
}

