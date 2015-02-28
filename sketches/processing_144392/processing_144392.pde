
  var viewsElement;//the view element we want to read and modify
  String oldViews;//to store the original count of views
  
void setup() {
  size(320,100);
  fill(0);
  smooth();
  Array.prototype.filter.call(parent.document.body.getElementsByClassName('tagLink'), function(element){//filter html elements, tagLink is the class name of the view counter and some other html elements on the sketch page
if(element.textContent.contains("views")){//search for "views" to get the view counter from all html elements with the filtered class name "tagLink"
    viewsElement=element;//store it in a global variable
    oldViews=element.textContent;//store the original count of views
}});
createViewsCounterIfNotExists();//only required on pages without the views counter e.g. the Edit Sketch page
}
  
void draw() {  background(255);
  
         viewsElement.textContent="\n    "+(1000000+frameCount)+"    views";//set the new view count

 viewsElement.style.backgroundColor = "#" + (240).toString(16) + (frameCount%50*4.8).toString(16)+ (frameCount%50*4.8).toString(16);  //just for the red flashing
    
     text("original:" ,50,10);
     text(oldViews ,50,10);
       
     text("changed to:" ,50,50);
     text(viewsElement.textContent ,50,50);
       
     text("watch the count of views in 'about this sketch' section" ,10,85);
}

void createViewsCounterIfNotExists(){//only required on pages without the views counter e.g. the Edit Sketch page
if(!viewsElement){  //if the viewsElement is still empty (e.g. on the Edit Sketch page or any other page without the view counter)
oldViews="\n    0    views";
  viewsElement = document.createElement('div');//create a new viewsElement
       parent.document.body.insertBefore(viewsElement, parent.document.body.children[0]);//and insert it to the top of the page. This just makes the sketch running on any page WITHOUT the views counter
     viewsElement.className='tagLink'; //set the class name to make it re-accessible
     viewsElement.style.padding="40px"; //set padding to move the text
 } }
