
String[] pieces;
String[] nums;
String[] hf = {// for hedder & footer
  "<stroke>", "<drawing>", "<tag>", "<GML>", "</stroke>", "</drawing>", "</tag>", "</GML>"};
String[] fileName;
String x, y, z;

float maxLat, maxLng, maxH, minLat, minLng, minH;
float factorW, factorH;
float addZ;


void setup() {
  String loadPath = selectInput();//select kml file
  XMLElement kml = new XMLElement(this, loadPath);

  //for the file name
  String allPath[] = split(loadPath, "/");
  fileName = split(allPath[allPath.length-1], ".");
  
  //extract the "coordinates" content
  XMLElement coordinates;
  coordinates = kml.getChild("Document/Placemark/MultiGeometry/LineString/coordinates");
  if(coordinates == null) coordinates = kml.getChild("Document/Placemark/LineString/coordinates");

  //calculate maxmum & minimum
  pieces = splitTokens(coordinates.getContent(), "  ");
  pieces = trim(pieces);//trim the indent
  nums = split(pieces[0], ',');
  minLat = float(nums[0]);
  minLng = float(nums[1]);
  minH = float(nums[2]);
  
  for (int i=1; i<pieces.length-1; i++){
    nums = split(pieces[i], ',');
    if (maxLat < float(nums[0])) maxLat = float(nums[0]);
    if (minLat > float(nums[0])) minLat = float(nums[0]);
    if (maxLng < float(nums[1])) maxLng = float(nums[1]);
    if (minLng > float(nums[1])) minLng = float(nums[1]);
    if (maxH < float(nums[2])) maxH = float(nums[2]);
    if (minH > float(nums[2])) minH = float(nums[2]);
  }

  //calculate factor
  float w = maxLat - minLat;
  float h = maxLng - minLng;
  if(w > h) {
    factorW = 1.0;
    factorH = h / w;
  }
  else{
    factorW = w / h;
    factorH = 1.0;
  }  
}

void draw(){
  String[] data = new String[pieces.length-1];
  print(pieces.length*0.2);
  for(int i = 0; i < pieces.length-1; i++){
    //mapping nums + generate gml data
    nums = split(pieces[i], ',');
    x = str(map(float(nums[0]), minLat, maxLat, 0.0, factorW));
    y = str(1 - map(float(nums[1]), minLng, maxLng, 0.0, factorH));
    addZ += float(nums[2])/100;
    z = str(addZ);
    data[i] = "<pt><x>"+x+"</x><y>"+y+"</y><z>"+z+"</z><time>"+str(float(i)/(pieces.length*0.2))+"</time></pt>";
  }

  //add tags which is nessesary for .gml
  for(int i = 0; i<hf.length; i++){
    if(i < hf.length/2){
      data = splice(data, hf[i], 0);
    }
    else{
      data = append(data, hf[i]);
    }      
  }

  //save the .gml file
  saveStrings(fileName[0] + ".gml", data);
  exit();
}


