
int Talla, Edat;
float PI, PR; 
Talla=160;
Edat=20;
PR=61.8;
PI= Talla-100+(Edat/10)*0.9;
println ("Per l'edat de "+Edat+" i l'alçada "+Talla+" el PI és "+ PI);
if (PR > PI) {println ("Per la teva salut t'has d'aprimar,has de perdre "+ (PR-PI));}

else         {if (PR == PI) {println ("El teu pes és l'ideal");}
              else {println ("Per la teva salut t'has d'engreixar, has de guanyar "+ (PI-PR));}
             }

 

  
