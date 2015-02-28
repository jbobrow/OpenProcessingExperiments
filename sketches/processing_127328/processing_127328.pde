
// This sketch builds on a prior work, "Modified clone of 'Modified clone of 'Projet_VI_Foot''", created by Etienne GAY
// http://studio.sketchpad.cc/sp/pad/view/ro.9X4Eti3B9vOM2/rev.36



// This sketch builds on a prior work, "Modified clone of 'Projet_VI_Foot'", created by Etienne GAY
// http://studio.sketchpad.cc/sp/pad/view/ro.9lPO8zf7StZji/rev.304



// This sketch builds on a prior work, "Projet_VI_Foot", created by Etienne GAY
// http://studio.sketchpad.cc/sp/pad/view/ro.91Dq5PktZpeap/rev.240



// Pressing Control-R will render this sketch.


String dataL1_09_10[] = loadStrings("/static/uploaded_resources/p.13233/france-2009-2010.txt");
String dataL1_10_11[] = loadStrings("/static/uploaded_resources/p.13233/france-2010-2011.txt");
String dataL1_11_12[] = loadStrings("/static/uploaded_resources/p.13233/france-2011-2012.txt");
String dataL1_12_13[] = loadStrings("/static/uploaded_resources/p.13233/france-2012-2013.txt");
String dataL1_13_14[] = loadStrings("/static/uploaded_resources/p.13233/france-2013-2014.txt");

int i = 0;

ArrayList parseJournee(String[] dataAnnee){
    ArrayList saison = new ArrayList();
    ArrayList journee = new ArrayList();
    for (int i=0; i < dataAnnee.length; i++) {
        if((i%12) != 0){
            if(dataAnnee[i] != ""){
                journee.add(dataAnnee[i]);
            }
        }else{
            journee = new ArrayList();
            saison.add(journee);
        }
    }
    return saison;
}

void setup() {  // this is run once.   
    
    //charger donnée
    println("Il y a " + dataL1_09_10.length + " lignes pour 09_10");
    println("Il y a " + dataL1_10_11.length + " lignes pour 10_11");
    println("Il y a " + dataL1_11_12.length + " lignes pour 11_12");
    println("Il y a " + dataL1_12_13.length + " lignes pour 12_13");
    println("Il y a " + dataL1_13_14.length + " lignes pour 13_14");
    //parser donnée
    ArrayList L1_09_10 = parseJournee(dataL1_09_10);
    for (int i=0; i < 10; i++) {
        println(L1_09_10.get(0).get(i));
    }
    
    // set the background color
    background(255);
    // canvas size (Variable aren't evaluated. Integers only, please.)
    size(300, 300);  
    // smooth edges
    smooth();
    // limit the number of frames per second
    frameRate(30);
    // set the width of the line. 
    strokeWeight(12);
    
    
} 

void draw() {  // this is run repeatedly.  

    // set the color
    stroke(random(50), random(255), random(255), 100);
    
    // draw the line
    line(i, 0, random(0, width), height);
    
    // move over a pixel
    if (i < width) {
        i++;
    } else {
        i = 0; 
    }
}

