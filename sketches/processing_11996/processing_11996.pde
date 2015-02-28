


import proxml.*;//load the library
float textx  = 100;
XMLInOut flickrLatLong;//declaring variable called flickrLatLong of type XMLInOUt
String url;//declaring variable called url of String type
PImage myImage; //declare myImage of variable type PImage 
//Ellipse[] ellipses;
//array for lat and lon below - know how many you'll have from child count
//float pc;
//int filler = 127;//declare and initialize an integer named filler 
int changer = 5;//declare and initialize an int named changer
ArrayList data = new ArrayList();//declare a new arrayList called data, using the 
//operator "new" 
Boolean button = false;//initialize a Boolean named button as false 
Boolean isDone = false;///initialize a Boolean named isDone because I 
//don't want be write sketch until the data is all retrieved from flickr(since proxml
//is threaded
PFont myFont;//declare a PFont called myFont
PImage fire;//declare an image called fire of PImage type
WorldMap wmap;
String location;//declare a String variable named location
float lat;//declare a float named lat
float lon;//eitherput this stuff here or declare it later as float
float pc;
float dataMinLat = MAX_FLOAT;
float dataMaxLat = MIN_FLOAT;
float dataMinLon = MAX_FLOAT;
float dataMaxLon = MIN_FLOAT;
float dataMinPC = MAX_FLOAT;
float dataMaxPC = MIN_FLOAT;
Fire[] myFires;
float xpos =width/3;
float ypos = 20;
void setup()//where the function called setup is defined

{
  //background(255);//
  
  smooth();
  noStroke();
  size(1000,500);//calling function size, passing 2 arguments to it of width and height
  wmap = new WorldMap(0,0,width, height);
 
  url = "http://api.flickr.com/services/rest/?method=flickr.places.placesForTags&api_key=9a922b245435d7c8ef52e8f0700905d1&place_type_id=7&tags=wildfire%2C+wildland+fire%2C+&tag_mode=any";
  //initializing url with a String that holds a web address (" " tell computer it's a string)

  flickrLatLong = new XMLInOut(this);//initializing the variable flickr lat long and giving it a parameter of this
  //this is the name of the pApplet 
  flickrLatLong.loadElement(url);//calling the function loadElement on the object FLL, passing the url into it as a parameter
  //contacting / sending request to flickr api with data from url


  myFont = createFont("FFScala", 12); //initialize create font named myFont with the parameters ffscala and size
  textFont(myFont); //call function textFont with myFont as a parameter

}

void makeFires()//write the function  
  {//if (isDone){
    int ypos= 10;
    for(int i = 0; i< data.size(); i++)//loop through data to get all datapoits
    {
    //println("making fire!");
    ArrayList thisLocation = new ArrayList();//make a new arraylist named thisLocation, this will hold the arrayList we get from data IT'S A HOLDER
    thisLocation = (ArrayList) data.get(i);//loop through and get all the data in the thisLocation arraylist this location
    float lat = (Float) thisLocation.get(0);// get the float at the 0th location-- this is lat
    //lat = map(lat, dataMinLat, dataMaxLat,  width-50, 50);//map the lat 
    float lon = (Float) thisLocation.get(1);//get the float at the first position of thisLocation arraylist and name it lon
   // lon = map(lon, dataMinLon, dataMaxLon, 50, height-50);
    float pc = (Float) thisLocation.get(2);
    pc = map(pc, dataMinPC, dataMaxPC, 10,200);
    String location = (String) thisLocation.get(3);//get the string at the 3rd position of the arrayList "thisLocation" and name it location
     println(location);
   println(lat);
   println(lon);
   println(pc);
          
    
    Fire fireObject = new Fire(lat, lon, pc, pc, location, 10,ypos);//make a Fire type object called fireObject with the parameters lat, lon, pc, location, (new means this is a new object, then you call the constructor)
    myFires[i] = fireObject;//adding this object to the myFIre array-
    ypos+=10;
  }
  isDone = true;
  //println(myFires.length + "this is the length");
}
  

void draw()
{//background(255,0,0,127);
 wmap.drawBackground();
  if(isDone)
  {
  for (int i = 0; i <myFires.length; i++)
  {
    //println("draw!");
    myFires[i].display(mouseX, mouseY);
    myFires[i].showName(mouseX, mouseY);
  }
  } 
}  

void xmlEvent(proxml.XMLElement _x)//writing / defining a function which will take as a parameter the xmlelement named _x
//this funct xmlelement gets called when a response comes back from flickr api
{

  String name = _x.getName(); //get the name of _x called name, of return type String

  proxml.XMLElement node1 = _x.getChild(0);//get the next node down (called node 1), the first child of _x
  int count = node1.countChildren();//count the children of node1

    for (int i=0; i<count-1; i++)
    {

    proxml.XMLElement place =node1.getChild(i);//get each child i of node1, call it place
    lat =(place.getFloatAttribute("latitude"));//get the attribute of "latitude" called location in floats at each place
    //declared up top as a float 
    lon = (place.getFloatAttribute("longitude"));
    pc = (place.getFloatAttribute("photo_count"));
    
   String locationName = place.getChild(0).getElement(); //this is the name of the location
   println(locationName);
   println(lat);
   println(lon);
   println(pc);
          
    if(lat<dataMinLat){
      dataMinLat = lat;
    }
    if(lat>dataMinLat){
      dataMaxLat = lat;
    }
    if (lon<dataMinLon){
      dataMinLon=lon;
    }
    if (lon>dataMaxLon){
      dataMaxLon = lon;
    }
    if(pc<dataMinPC){
      dataMinPC = pc;
    }
    if (pc>dataMaxPC){
      dataMaxPC = pc;
    }
    
    ArrayList myLocData = new ArrayList();//make a new AL for location, lat, lon, pc
    
    myLocData.add(lat);
    myLocData.add(lon);
    myLocData.add(pc);
    myLocData.add(locationName);
    data.add(myLocData);//add the myLatLon info  as saved as the myLocData arrayList into data, the main data structure
   }
//  println("these are max and min");
//  println(dataMinLat);
//  println(dataMinLon);
//  println(dataMaxLon);
//  println(dataMaxLat);
  myFires = new Fire[data.size()];
  makeFires();
}

//keep photo position x object outside main program , that will be grabbed each time wnana show a photo
//show one photo, photoposition x is incremented, then , so scroll across
//grabbing that into use

//draw correct photo if detects the mouse is over that specific point, if 2 points are overlapping it'll draw both photos
//in same position
//so if you skew the x globally, each time you draw a photo you increment an x position 
//so you should go across
//x pos relat to mouse x mouse y, or draw them all in the corner

//when mouse moves reset it, keep x to be whatever mouse x mouse y is
//stop the glowing background


