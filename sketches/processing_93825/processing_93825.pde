
static String l[];
ArrayList<Food> food;
ArrayList<String> conds;
ArrayList<Integer> condn;
int[] nums = new int[6];

void setup(){
  size(1000,400);
  XMLElement xml = new XMLElement(this, "Foods_Needing_Condiments_Table.xml");
  food = new ArrayList<Food>(xml.getChildCount() - 1);
  conds = new ArrayList<String>();
  condn = new ArrayList<Integer>();
  XMLElement[] fnc = xml.getChildren();
  for(int i = 0; i < fnc.length; i++ ){
    XMLElement name = fnc[i].getChild(1);
    String n = (String) name.getContent();
    ArrayList<String> c = new ArrayList<String>();
    XMLElement[] cofnc = fnc[i].getChildren();
    for(int j = 3; j < cofnc.length; j+=2){
      c.add(cofnc[j].getContent());
      if(!conds.contains(cofnc[j].getContent())){
        conds.add(cofnc[j].getContent());
        condn.add(new Integer(1));
      } else {
        int sup = conds.indexOf(cofnc[j].getContent());
        condn.set(sup,condn.get(sup) + 1);
      }
    }
    nums[c.size()]++; 
    food.add(new Food(n,c));
  }
  
  /*
  translate(0,0);
  textFont(createFont("Arial",10,true));  
  textAlign(LEFT);
  float lastAngle = 0;
  rect(0,0,300,250);
  for (int i = 0; i < angles.length; i++) {
    fill((int)(Math.random()*200),(int)(Math.random()*200), 255);
    arc(112.5, 137.5, 200, 200, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
    rect(250,100+(i*20),10,10);
    text(i+1,270,108+(i*20)); 
  }
  */
//  translate(0,0);
}
void draw(){
  float h = 300.0;
  float m = (float) maxInt(condn);
  rect(25,10,600,375);
  line(50,50,condn.size()*5 + 60,50);
  line(50,50,50,h+60);
  line(45,h+51,50,h+51);
  textFont(createFont("Arial",8,true));
  fill(0);
  textAlign(RIGHT);
  text((int) m + "",43,h+54);
  textFont(createFont("Arial",10,true));
  textAlign(CENTER);
  text("Number of Foods with Specific Conduments",(condn.size()*5 + 300)/2,30);
  text("Conduments",(condn.size()*5 + 60)/2,48);
  textVertical("# of Foods w/ Condument",45,90,"Arial",10,true);
  textAlign(LEFT);
  textFont(createFont("Arial",8,true));
  for(int i = 0; i < conds.size(); i++){
    fill((int)(Math.random()*200),(int)(Math.random()*200), 255);
    rect(i*5 + 51,51,5,condn.get(i)*h/m);
    rect(400,50+(i*5),5,5);
    fill(0);
    text(conds.get(i),412,55+(i*5)); 
  }
  
  float[] angles = new float[5];
  for(int i = 1; i < nums.length; i++){
    angles[i-1] = nums[i]*360.0/food.size();
  }
  
  translate(650,50);
  textFont(createFont("Arial",10,true));
  textAlign(CENTER);
  float lastAngle = 0;
  stroke(0);
  fill(255);
  rect(0,0,300,250);
  fill(0);
  text("Number of Conduments for a Food",150,30);
  textAlign(LEFT);
  for (int i = 0; i < angles.length; i++) {
    fill((int)(Math.random()*200),(int)(Math.random()*200), 255);
    arc(112.5, 137.5, 200, 200, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
    rect(250,100+(i*20),10,10);
    text(i+1,270,108+(i*20)); 
  }
  noLoop();
}

class Food {
    public String Name;
    public ArrayList <String> Cond;
    
    Food(String n, ArrayList <String> c) {
        Name = n;
        Cond = c;
    }
    
    String toString() {
        return Name + Cond;
    }
}

int maxInt(ArrayList<Integer> a){
  int m = Integer.MIN_VALUE;
  for(int i = 0; i < a.size(); i++){
    if(a.get(i) > m){
      m = a.get(i);
    }
  }
  return m;
}

void textVertical(String t, int x, int y, String f, int s, boolean b){
  textFont(createFont(f,s,b));
  for(int i = 0; i < t.length(); i++){
    text(t.charAt(i),x,y);
    y += s - 2;
  }
}

