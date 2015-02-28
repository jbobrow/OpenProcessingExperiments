
HTMLElement favIcon=document.createElement('link');  favIcon.rel='shortcut icon';//favIcon.type='image/x-icon';//create a new icon, set the "rel" attribute
// HTMLElement favIcon=parent.document.getElementsByTagName("link")[0];//alternative get the current icon

void draw() { 
    background(frameCount%50*4.8,frameCount%50*4.8,240);//animate the background
    rect((frameCount)%width,(frameCount*2)%width,20,20);//draw a "animation"
    rect(mouseX,mouseY,20,20);//draw a "mouse pointer"

favIcon.href=externals.canvas.toDataURL("image/jpeg",0.7);//set the "screenshot" as href to the icon
parent.document.head.appendChild(favIcon);//re-append it to the head to update
 
parent.document.title = "MySketch fps: "+round(frameRate);// set a custom title for the browser tab/title
 }
