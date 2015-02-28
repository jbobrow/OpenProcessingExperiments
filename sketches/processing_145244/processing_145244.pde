
 HTMLElement selectedThumbnail=parent.document.body.getElementsByClassName('visThumbnail50 selected')[0].children[0];// get the selected Thumbnail HTMLElement 
//HTMLElement selectedThumbnail=parent.document.body.children[0].appendChild(document.createElement('img'));//or add a new imgElement to the page
selectedThumbnail.style.width="50px";//fix the width


   
void draw() {  
    background(240,frameCount%50*4.8,frameCount%50*4.8);//animate the background
    ellipse((frameCount)%width,(frameCount*2)%width,10,10);//draw a "animation"
    ellipse(mouseX,mouseY,10,10);//draw a "mouse pointer"

//if(frameCount%3==0)//only update the Thumbnail every 3rd frame
    selectedThumbnail.src=externals.canvas.toDataURL("image/jpeg",0.7);// take a screenshot from the sketch and place it in the imgElement
    //selectedThumbnail.src=document.getElementsByTagName("canvas")[0].toDataURL();//alternative code,   image/jpeg or image/webp quality 0.1 - 1.0
 }

