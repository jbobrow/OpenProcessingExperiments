
class boxes{
 float x;
 float y;

String texts;
int col;
boxes(float tempx,float tempy,String temptexts,int tempcol){

texts=temptexts;
col=tempcol;
x=tempx;
y=tempy;
}
void display(){
 stroke(col);
 strokeWeight(col);
 noFill();
  ellipse(x,y,20,20);
  text(texts,x,y);
}
void move(){
  x+=0.02;
  y+=0.02;
}
}
boxes box1;
float created=0;
boolean finished=false;
int counter=0;
 String query=" ";
void setup(){
  size(screen.width,screen.height);
}
void draw(){
  background(0);
if(created==1){
 // box1.x+=(mouseX-box1.x)*0.02;
//box1.y+=(mouseY-box1.y)*0.02;

}
  pushMatrix();
  fill(255,0,0);
  textSize(15);
  text("enter search/tab to erase");
  popMatrix();
  translate(0,20);
    fill(255);
    textSize(20);
text(query,20,20);
  //frameRate(1);
// Replace this with a developer key from http://developer.yahoo.com
String appid = "dj0yJmk9cHIwQVo4QzFZU1dUJmQ9WVdrOVJWTmlUMlpSTlRRbWNHbzlNVGt3TXpZeU9EZzJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD00NA--";
SearchClient client = new SearchClient(appid);
finished=false;

if(key==ENTER){

  WebSearchRequest request = new WebSearchRequest(query);
// (Optional) Set the maximum number of results to download
//request.setResults(30);
try {
WebSearchResults results = client.webSearch(request);
// Print out how many hits were found
println("Displaying " + results.getTotalResultsReturned() +
" out of " + results.getTotalResultsAvailable() + " hits.");
println();
// Get a list of the search results
WebSearchResult[] resultList = results.listResults();
// Loop through the results and print them to the console
for (int i = 0; i < resultList.length; i++) {
// Print out the document title and URL.
println((i + 1) + ".");
textSize(10);
translate(0,i+10);
text(i+": "+resultList[i].getTitle(),20,20);

translate(0,i+10);
text(resultList[i].getUrl(),20,20);
println(query);
  //finished=true;
  boxes box1;
box1= new boxes(600,i*7,resultList[i].getTitle(),i*10);
box1.display();
//box1.move();
created=1;


}

} catch (IOException e) {
println("Error calling Yahoo! Search Service: " + e.toString());
e.printStackTrace();
} catch (SearchException e) {
println("Error calling Yahoo! Search Service: " + e.toString());
e.printStackTrace();
}
}
}


void keyReleased(){
query=query+key;

if(key==TAB){
  query="";
}
}

