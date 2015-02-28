
Elements ele; String typedText = ""; boolean pp = false;

void setup() {
  size(1000,600);
  ele = new Elements();
}

void draw() {
  background(255); ele.display(); if(!keyPressed) { pp = false; }
}

void keyReleased() { if(!pp) { if (key != CODED) { switch(key) { case BACKSPACE: typedText = typedText.substring(0,max(0,typedText.length()-1));
      break; case TAB: case ENTER: case RETURN: case ESC: case DELETE: break; default: char s = key;
      if(int(key)<91&&int(key)>64) { s = char(int(key) +32); } if(typedText.length()<13) { typedText += s; }}} pp = true;
  }
}

class Elements {
  float sx; float sy; int ne = 118; int o = 1;
  String[] n = new String[ne]; String[] s = new String[ne]; String[] l = new String[ne]; String[] m = new String[ne];
  String[] r = new String[ne]; String[] p = new String[ne]; String[] u = new String[ne];
  color[] t = new color[ne]; PVector[] at = new PVector[ne];
  Elements() { sx = width/37; sy = height/20; t[0] = color(255); for(int i=2;i<19;i+=8) { t[i] = color(255,0,127); t[i+1] = color(255,0,255); }
    t[36] = color(255,0,127); t[37] = color(255,0,255); for(int i=54;i<87;i+=32) { t[i] = color(255,0,127); t[i+1] = color(255,0,255); }
    t[20] = color(191,191,255); t[38] = color(191,191,255); for(int i=21;i<30;i++) { t[i] = color(191,191,255); t[i+18] = color(191,191,255);
    t[i+50] = color(191,191,255); t[i+83] = color(191,191,255); } for(int i=56;i<71;i++) { t[i] = color(127,255,127); t[i+32] = color(255,0,0); }
    t[4]=color(0,191,0);t[13]=color(0,191,0);t[31]=color(0,191,0);t[32]=color(0,191,0);t[50]=color(0,191,0);t[51]=color(0,191,0);t[83]=color(0,191,0);
    t[5]=color(0,255,0);t[6]=color(0,255,0);t[7]=color(0,255,0);t[14]=color(0,255,0);t[15]=color(0,255,0);t[33]=color(0,255,0);t[12]=color(255,127,0);
    t[30]=color(255,127,0);t[48]=color(255,127,0);t[49]=color(255,127,0);t[80]=color(255,127,0);t[81]=color(255,127,0);t[82]=color(255,127,0);
    for(int i=112;i<116;i++) { t[i]=color(255,127,0); } t[8]=color(255,255,0);t[16]=color(255,255,0);t[34]=color(255,255,0);t[52]=color(255,255,0);
    t[84]=color(255,255,0);t[116]=color(255,255,0);t[1]=color(255,191,0);t[9]=color(255,191,0);t[17]=color(255,191,0);t[35]=color(255,191,0);
    t[53]=color(255,191,0);t[85]=color(255,191,0);t[117]=color(255,191,0);t[103]=color(191,191,255);
    at[0] = new PVector(0, 0); at[1] = new PVector(sx*35, 0); at[2] = new PVector(0, sy*2); at[3] = new PVector(sx*2, sy*2);
    at[4] = new PVector(sx*25, sy*2); at[5] = new PVector(sx*27, sy*2); at[6] = new PVector(sx*29, sy*2); at[7] = new PVector(sx*31, sy*2);
    at[8] = new PVector(sx*33, sy*2); at[9] = new PVector(sx*35, sy*2); at[10] = new PVector(0, sy*4); at[11] = new PVector(sx*2, sy*4);
    at[12] = new PVector(sx*25, sy*4); at[13] = new PVector(sx*27, sy*4); at[14] = new PVector(sx*29, sy*4); at[15] = new PVector(sx*31, sy*4);
    at[16] = new PVector(sx*33, sy*4); at[17] = new PVector(sx*35, sy*4); at[18] = new PVector(0, sy*6); at[19] = new PVector(sx*2, sy*6);
    at[36] = new PVector(0, sy*8); at[37] = new PVector(sx*2, sy*8); for(int i = 5; i < 37; i += 2) { at[(i+1)/2+17] = new PVector(sx*i, sy*6);
    at[(i+1)/2+35] = new PVector(sx*i, sy*8); } at[54] = new PVector(0, sy*10); at[55] = new PVector(sx*2, sy*10); at[86] = new PVector(0, sy*12);
    at[87] = new PVector(sx*2, sy*12); for(int i=5;i<35;i+=2) { at[(i+1)/2+53] = new PVector(sx*i, sy*15); at[(i+1)/2+85] = new PVector(sx*i, sy*17);
    } for(int i = 7; i < 37; i += 2) { at[(i+1)/2+67] = new PVector(sx*i, sy*10); at[(i+1)/2+99] = new PVector(sx*i, sy*12); }
    s[0]="H";s[1]="He";s[2]="Li";s[3]="Be";s[4]="B";s[5]="C";s[6]="N";s[7]="O";s[8]="F";s[9]="Ne";s[10]="Na";s[11]="Mg";s[12]="Al";s[13]="Si";
    s[14]="P";s[15]="S";s[16]="Cl";s[17]="Ar";s[18]="K";s[19]="Ca";s[20]="Sc";s[21]="Ti";s[22]="V";s[23]="Cr";s[24]="Mn";s[25]="Fe";s[26]="Co";
    s[27]="Ni";s[28]="Cu";s[29]="Zn";s[30]="Ga";s[31]="Ge";s[32]="As";s[33]="Se";s[34]="Br";s[35]="Kr";s[36]="Rb";s[37]="Sr";s[38]="Y";s[39]="Zr";
    s[40]="Nb";s[41]="Mo";s[42]="Tc";s[43]="Ru";s[44]="Rh";s[45]="Pd";s[46]="Ag";s[47]="Cd";s[48]="In";s[49]="Sn";s[50]="Sb";s[51]="Te";s[52]="I";
    s[53]="Xe";s[54]="Cs";s[55]="Ba";s[56]="La";s[57]="Ce";s[58]="Pr";s[59]="Nd";s[60]="Pm";s[61]="Sm";s[62]="Eu";s[63]="Gd";s[64]="Tb";s[65]="Dy";
    s[66]="Ho";s[67]="Er";s[68]="Tm";s[69]="Yb";s[70]="Lu";s[71]="Hf";s[72]="Ta";s[73]="W";s[74]="Re";s[75]="Os";s[76]="Ir";s[77]="Pt";s[78]="Au";
    s[79]="Hg";s[80]="Tl";s[81]="Pb";s[82]="Bi";s[83]="Po";s[84]="At";s[85]="Rn";s[86]="Fr";s[87]="Ra";s[88]="Ac";s[89]="Th";s[90]="Pa";s[91]="U";
    s[92]="Np";s[93]="Pu";s[94]="Am";s[95]="Cm";s[96]="Bk";s[97]="Cf";s[98]="Es";s[99]="Fm";s[100]="Md";s[101]="No";s[102]="Lr";s[103]="Rf";
    s[104]="Db";s[105]="Sg";s[106]="Bh";s[107]="Hs";s[108]="Mt";s[109]="Ds";s[110]="Rg";s[111]="Cn";s[112]="Uut";s[113]="Fl";s[114]="Uup";
    s[115]="Lv";s[116]="Uus";s[117]="Uuo";
    n[0]="Hydrogen";n[1]="Helium";n[2]="Lithium";n[3]="Berylium";n[4]="Boron";n[5]="Carbon";n[6]="Nitrogen";n[7]="Oxygen";n[8]="Fluorine";
    n[9]="Neon";n[10]="Sodium";n[11]="Magnesium";n[12]="Aluminium";n[13]="Silicon";n[14]="Phosphorus";n[15]="Sulfur";n[16]="Chlorine";n[17]="Argon";
    n[18]="Potassium";n[19]="Calcium";n[20]="Scandium";n[21]="Titanium";n[22]="Vanadium";n[23]="Chromium";n[24]="Manganese";n[25]="Iron";
    n[26]="Cobolt"; n[27]="Nickel";n[28]="Copper";n[29]="Zinc";n[30]="Gallium";n[31]="Germanium";n[32]="Arsenic";n[33]="Selenium";n[34]="Bromine";
    n[35]="Krypton";n[36]="Rubidium";n[37]="Strontium";n[38]="Yttrium";n[39]="Zirconium";n[40]="Niobium";n[41]="Molybdenum";n[42]="Technetium";
    n[43]="Ruthenium";n[44]="Rhodium";n[45]="Palladium";n[46]="Silver";n[47]="Cadmium";n[48]="Indium";n[49]="Tin";n[50]="Antimony";n[51]="Tellurium";
    n[52]="Iodine";n[53]="Xenon";n[54]="Cesium";n[55]="Barium"; n[56]="Lanthanum";n[57]="Cerium";n[58]="Praseodymium";n[59]="Neodymium";
    n[60]="Promethium";n[61]="Samarium";n[62]="Europium";n[63]="Gadolinium";n[64]="Terbium";n[65]="Dysprosium";n[66]="Holmium";n[67]="Erbium";
    n[68]="Thullium";n[69]="Ytterbium";n[70]="Lutetium";n[71]="Hafnium";n[72]="Tantalum";n[73]="Tungtsen";n[74]="Rhenium";n[75]="Osmium";
    n[76]="Iridium";n[77]="Platinum";n[78]="Gold";n[79]="Mercury";n[80]="Thallium";n[81]="Lead";n[82]="Bismuth";n[83]="Polonium";n[84]="Astatine";
    n[85]="Radon";n[86]="Francium";n[87]="Radium";n[88]="Actinium";n[89]="Thorium";n[90]="Protactinium";n[91]="Uranium";n[92]="Neptunium";
    n[93]="Plutonium";n[94]="Americium";n[95]="Curium";n[96]="Berkelium";n[97]="Californium";n[98]="Einsteinium";n[99]="Fermium";n[100]="Mendelevium";
    n[101]="Nobelium";n[102]="Lawrencium";n[103]="Rutherfordium";n[104]="Dubnium";n[105]="Seaborgium";n[106]="Bohrium";n[107]="Hassium";
    n[108]="Meitnerium";n[109]="Darmstadtium";n[110]="Roentgenium";n[111]="Copernicium";n[112]="Ununtrium";n[113]="Flerovium";n[114]="Ununpentium";
    n[115]="Livermorium";n[116]="Ununseptium";n[117]="Ununoctium";
    for(int i = 0; i < 42; i++) { r[i]="stable | safe"; } for(int i = 43; i < 60; i++) { r[i]="stable | safe"; } for(int i = 61; i < 82; i++) {
    r[i]="stable | safe"; } r[42]="long half-life | safe";r[82]="long half-life | safe";r[89]="long half-life | safe";r[95]="long half-life | safe";
    for(int i = 91; i < 94; i++) { r[i]="long half-life | safe"; } r[87]="half-life over 500 years | low health hazard";
    r[90]="half-life over 500 years | low health hazard";r[94]="half-life over 500 years | low health hazard";
    r[96]="half-life over 500 years | low health hazard";r[97]="half-life over 500 years | low health hazard";
    r[83]="half-life over 500 years | low health hazard";r[60]="half-life over 1 day | potential high health risk";
    r[85]="half-life over 1 day | potential high health risk";r[88]="half-life over 1 day | potential high health risk";
    r[98]="half-life over 1 day | potential high health risk";r[99]="half-life over 1 day | potential high health risk";
    r[100]="half-life over 1 day | potential high health risk";r[104]="half-life over 1 day | potential high health risk";
    r[84]="half-life over a few minutes | severe health risks";r[86]="half-life over a few minutes | severe health risks";
    for(int i = 101; i < 104; i++) { r[i]="half-life over a few minutes | severe health risks";
    r[i+5]="half-life over a few minutes | severe health risks";r[i+9]="half-life over a few minutes | severe health risks"; }
    r[105]="half-life over a few minutes | severe health risks";r[109]="half-life < 1minute | deadly unless lab contained";
    for(int i = 113; i < 118; i++) { r[i]="half-life < 1minute | deadly unless lab contained"; }
    for(int i = 0; i < 42; i++) { p[i]="natural, stable"; } for(int i = 43; i < 60; i++) { p[i]="natural, stable"; } for(int i = 61; i < 82; i++) {
    p[i]="natural, stable"; } p[82]="natural (industrially extractable), radioactive";p[89]="natural (industrially extractable), radioactive";
    p[91]="natural (industrially extractable), radioactive";p[42]="temporarily natural, radioactive";p[60]="temporarily natural, radioactive";
    p[90]="temporarily natural, radioactive"; for(int i = 83; i < 89; i++) { p[i]="temporarily natural, radioactive";
    p[i+9]="temporarily natural, radioactive"; } for(int i = 98; i < 118; i++) { p[i]="purely synthetic, radioactive"; }
    l[0]="gas";l[1]="gas";l[6]="gas";l[7]="gas";l[8]="gas";l[9]="gas";l[16]="gas";l[17]="gas";l[35]="gas";l[53]="gas";l[85]="gas";l[34]="liquid";
    l[79]="liquid";for(int i = 0; i < ne; i++) { if(l[i]!="gas" && l[i]!="liquid") { l[i]="solid"; }}
    m[0]="1.0079";m[1]="4.0026";m[2]="6.941";m[3]="9.0122";m[4]="10.811";m[5]="12.011";m[6]="14.007";m[7]="15.999";m[8]="18.998";m[9]="20.180";
    m[10]="22.990";m[11]="24.305";m[12]="26.982";m[13]="28.086";m[14]="30.974";m[15]="32.065";m[16]="35.453";m[17]="39.948";m[18]="39.098";m[19]="40.078";
    m[20]="44.956";m[21]="47.867";m[22]="50.942";m[23]="51.996";m[24]="54.938";m[25]="55.845";m[26]="58.933";m[27]="58.693";m[28]="63.546";m[29]="65.39";
    m[30]="69.723";m[31]="72.61";m[32]="74.922";m[33]="78.96";m[34]="79.904";m[35]="83.80";m[36]="85.468";m[37]="87.62";m[38]="88.906";m[39]="91.224";
    m[40]="92.906";m[41]="95.94";m[42]="[98]";m[43]="101.07";m[44]="102.91";m[45]="106.42";m[46]="107.87";m[47]="112.41";m[48]="114.82";m[49]="118.71";
    m[50]="121.76";m[51]="127.60";m[52]="126.90";m[53]="131.29";m[54]="132.91";m[55]="137.33";m[56]="138.91";m[57]="140.12";m[58]="140.91";m[59]="144.24";
    m[60]="[145]";m[61]="150.36";m[62]="151.96";m[63]="157.25";m[64]="158.93";m[65]="162.50";m[66]="164.93";m[67]="167.26";m[68]="168.93";m[69]="173.04";
    m[70]="174.97";m[71]="178.49";m[72]="180.95";m[73]="183.84";m[74]="186.21";m[75]="190.23";m[76]="192.22";m[77]="195.08";m[78]="196.97";m[79]="200.59";
    m[80]="204.38";m[81]="207.2";m[82]="208.98";m[83]="[209]";m[84]="[210]";m[85]="[222]";m[86]="[223]";m[87]="[226]";m[88]="[227]";m[89]="232.04";
    m[90]="231.04";m[91]="238.03";m[92]="[237]";m[93]="[244]";m[94]="[243]";m[95]="[247]";m[96]="[247]";m[97]="[251]";m[98]="[252]";m[99]="[257]";
    m[100]="[258]";m[101]="[259]";m[102]="[262]";m[103]="[261]";m[104]="[262]";m[105]="[266]";m[106]="[264]";m[107]="[269]";m[108]="[268]";m[109]="[271]";
    m[110]="[272]";m[111]="[277]";m[112]="unknown";m[113]="[289]";m[114]="unknown";m[115]="[298]";m[116]="unknown";m[117]="unknown";
    u[0]="90% of atoms in the universe and the lightest element. The main part of nuclear fusion, the sun and stars & life's organic molecules.";
    u[1]="Inert gas that is the result from nuclear fusion in stars. Used in balloons, lasers & supercold refrigerant.";
    u[2]="The lightest metal. Used in lightweight alloys, batteries, impact-resistant ceramic cookware & mood stabilizer.";
    u[3]="A lightweight metal. Used in non-sparking alloys, aerospace, X-ray windows, emeralds, and aquamarines.";
    u[4]="A hard, black solid. Used in borax soap, fertilizer, stiff fibers, sports equipment (golf clubs, tennis rackets, skis) & semiconductors.";
    u[5]="Can become different forms from graphite to diamond. Found in life's organic molecules animals, plants, paper, cloth, plastic, coal & oil.";
    u[6]="78% of the atmosphere's air. Found in proteins, muscles, DNA, ammonia, fertilizer, explosives(TNT) & refrgerants.";
    u[7]="21% of air and 65% of the human body. Found in organic molecules, blood, breath, fire, minerals, oxides & half of the earth's crust.";
    u[8]="A yellowish poison, the most reactive element. It's anion is fluoride, which is used in toothpaste & no-stick cookware";
    u[9]="An inert gas. Used in orange-red neon tubes and lights, lasers and supercold refrigerant,";
    u[10]="A soft, reactive metal. Found in salt (NaCl), nerves, baking soda, antacids, lye, soap, soda ash, glass, papermaking & street lamps.";
    u[11]="A lightweight metal. Found in chlorophyll (green plants), talc, basalt, aluminium alloys, cars, planes, bikes, flares, sparklers & antacids.";
    u[12]="A lightweight non-corroding metal. Used in common metal, cans, foil, machinery, cars, planes, bikes, granite, clay, ceramics, & gems.";
    u[13]="A hard metalloid. Found in quartz, granite, sand, soil, clay, ceramics, glass, algae, diatoms, semicoductors & computer chips.";
    u[14]="A glowing white waxy solid (also in red & black forms). Found in bones, DNA, ATP, fertilizer, acids, detergents & matches.";
    u[15]="A brittle yellow solid. Found in skin, hair, egg yolks, onions, garlic, skunks, hot springs, volcanoes, rubber, acids & papermaking.";
    u[16]="A greenish poisonous gas. Found in salt (NaCl), bleach, stomach acid, disinfectant, drinking water, Swimming pools & PVC plastic.";
    u[17]="1% of air & the most abundant inert gas on earth. Found in light bulbs, \"neon\" tubes, lasers & welding gas.";
    u[18]="A soft, reactive metal (first named 'Kalium'[K]). Found in salts, nerves, nutrient in fruits a vegetables, soap, fertilizer & gunpowder.";
    u[19]="A soft metal. Found in bones, teeth, milk, leaves, vegetables, shells, coral, limestone, chalk, gypsum, plaster, mortar, cement & marble.";
    u[20]="A soft, lightweight metal. Used to make aluminum alloys, racing bikes, stadium lamps, furnace bricks & aquamarines.";
    u[21]="The strongest lightweight metal & heat resistant. Used for aerospace, racing bikes, artificial joints, white paint & blue sapphires.";
    u[22]="A hard metal. Found in strong, resilient steel, structures, vehicles, springs, driveshafts, tools, aerospace & violet sapphires.";
    u[23]="A hard, shiny metal. Found in stainless steel (Fe-Cr-Ni), kitchenware, nichrome heaters, paints, recording tape, emeralds & rubies.";
    u[24]="A hard metal. Found in hard, tough steel, earthmovers, rock crushers, rails, plows, axes, batteries, fertilizer & amethysts.";
    u[25]="A medium-hard magnetic metal (first named 'Ferrum'[Fe]). Found in steel alloys, structures, vehicles, magnets, Earth's core & blood.";
    u[26]="A hard magnetic metal. Found in strong steel, cutting tools, turbines, magnets (Al-Ni-Co), blue glass & vitamin B-12.";
    u[27]="A medium-hard magnetic metal. Found in stainless steel (Fe-Cr-Ni), kitchenware, nichrome heaters, coins, batteries & Earth's core.";
    u[28]="A coloured metal & an electricity + heat conductor. Found in wires, cookware, brass (Cu-Zn), bronze (Cu-Sn), coins & blue crab blood.";
    u[29]="A non-corroding metal. Used in galvanized stell, brass (Cu-Zn), batteries, white paint, phosphors in TVs and lamps & fertilizer.";
    u[30]="A soft metal, can melt on a hot day. Used in semiconductors, light-emitting diodes (LEDs) (GaAs), signal lights & infrared windows.";
    u[31]="A brittle metalloid. Used in semiconductors, transisters, rectifiers, diodes, photocells, lenses & infrared windows.";
    u[32]="A brittle metalloid. Used in poisons, semiconductors, light-emmitting diodes (LEDs) (GaAs), signal lights & tiny lasers.";
    u[33]="A brittle grey solid. Used in semiconductors, photocopiers, laser printers, photocells, red glass, dandruff shampoo & rubber.";
    u[34]="Dark red coloured and one of the 2 liquids. Used in disinfecrant, pools and spas, photo film, flame retardant & sedatives.";
    u[35]="An inert gas. Used in high-intensity lamps, headlights, flashlights, lanterns, \"neon\" tubes & lasers.";
    u[36]="A soft, reactive metal. Used in atomic clocks & global navigation (global positioning system or GPS).";
    u[37]="A soft metal. Found in red fireworks, flares, phosphors, nuclear batteries, medical diagnostic tracers & nuclear fallout.";
    u[38]="A soft metal. Used in lasers (YAG, YLF), furnace bricks, high-temperature superconductors & phosphors in colour TVs.";
    u[39]="A non-corroding nuetron-resistant metal. Found in chemical pipelines, nuclear reactors, furnace bricks, abrasives and zircon gems.";
    u[40]="A high-melting-point non-corroding metal. Found in superconducters, magnetic levitation (mag-lev) trains & MRI magnets.";
    u[41]="A high-melting-point metal. Used in  hard steel, cutting tools, drill bits, armor plating, gun barrels & fertilizer.";
    u[42]="Radioactive, long-lived and the first human-made element. Only in traces on Earth, but found in stars. Used in x-ray machines.";
    u[43]="A non-corroding hard metal. Used in electric contacts, leaf switches, pen tips & hydrogen production. Also a catalyst.";
    u[44]="A non-corroding hard, shiny metal. Used in labware, reflectors, electric contacts & pollution control. Also a catalyst.";
    u[45]="A non-corroding hard metal that absorbs hydrogen. Used in labware, electric contacts, dentistry & pollution control. Also a catalyst.";
    u[46]="A soft shiny metal, the best electricity conductor (first named 'Argentum'[Ag]). Used in jewelry, silverware, coins, dentistry & photo film.";
    u[47]="A non-corroding soft, toxic metal. Used in electroplated steel, nicad batteries, red and yellow paints & fire sprinklers.";
    u[48]="A soft metal. Used in glass coatings, liquid crystal displays (LCD) (think calculator screens), semiconductors, diodes & photocells.";
    u[49]="A non-corroding soft metal (first named 'Stanum'[Sn]). Used in plated cans, bronze (Cu-Sn), glassmaking and fire sprinklers.";
    u[50]="A brittle metaloid (first named 'Stibium'[Sb]). Used in lead hardener, batteries, emetics (for vomitting), photocells & flame retardant.";
    u[51]="A brittle metaloid. Used in alloys, semiconductors, photocopiers, computer disks & thermo-electric coolers and generaters.";
    u[52]="A violet-black solid. Used in disinfectant for wounds and drinking water, add to salt to prevent thyroid disease & photofilm.";
    u[53]="An inert gas. Used in high-intensity lamps, headlights, stadium lamps, projectors, strobes, lasers & ion engines on spacecraft.";
    u[54]="A soft, reactive metal, can melt on a hot day, has the largest stable atoms. Used in atomic clocks & global positioning systems (GPS).";
    u[55]="A soft metal that absorbs x-rays. Used in stomach x-ray contrast enhancers, green fireworks & whitener and filler for paper.";
    u[56]="A soft metal, the start of the lanthanides. Used in optical glass, telescope eyepeices, camera lenses, lighter flints & arc lamps.";
    u[57]="A soft metal, the most abundant rare Earth metal. Used in arc lamps, gas lamp mantles, self-cleaning ovens & glass polishing.";
    u[58]="A soft metal. Used in torchworks' didymium eyeglasses, light flints, arc lamps, magnets & yellow glass.";
    u[59]="A soft metal. Used in strong magnets (Nd-Fe-B), electric motors, speakers and headphones, lasers & lighter flints.";
    u[60]="A radioactive, long-lived metal. Mostly man-made, only small traces in nature. Used in luminous dials & sheet thickness gauges.";
    u[61]="A soft metal. Used in magnets (Sm-Co), electric motors, speakers and headphones, infrared sensors & infrared-absorbing glass.";
    u[62]="A soft metal. Used in phosphors in colour TVs and trichromatic fluorescent lamps, luminous paint & lasers.";
    u[63]="A soft, magnetic metal and the best neutron absorber. Used in magnetic resonance imaging (MRI), phosphors & nuetron radiography.";
    u[64]="A soft metal. Used in phosphors in TVs and trichromatic lamps, computer disks & magnetostrictive materials (Fe-Dy-Tb).";
    u[65]="A soft metal. Used in nuclear control rods, MRI phosphors, computer disks & magnetostrictive materials (Fe-Dy-Tb).";
    u[66]="A soft metal. Used in infrared lasers, laser surgery, eye-safe laser rangefinders, computer disks and yellow glass filters.";
    u[67]="A soft metal. Used in fiber optic signal amplifiers, infrared lasers, laser surgery, pink glass, sunglasses and vanadium alloys.";
    u[68]="A soft metal, the rarest stable Earth metal. Used in infrared lasers, phosphors & laser surgery.";
    u[69]="A soft metal. Used in fiber optic signal amplifiers, infrared fiber lasers & stainless steel alloys.";
    u[70]="A soft metal, the densest & hardest rare Earth metal. Used in cancer-fighting photodunamic (light-activated) medicine.";
    u[71]="A non-corroding metal that absorbs neutrons. Used in nuclear reactor control rods in submarines & plasma torch electrodes.";
    u[72]="A high-melting-point non-corroding dense metal. Used in labware, surgical tools, artificial joints, capacitors & mobile phones.";
    u[73]="Has the highest melting-point of metals (first named 'Wolfram'[W]). Used in filaments, cutting tools, abrasives & thermocouples.";
    u[74]="A high-melting-point dense metal. Used in rocket engines, heater coils, laboratory filaments & electric contacts. Also a catalyst.";
    u[75]="A non-corroding high-melting point hard metal. It & Iridium are the densest elements. Used in pentips, needles & fingerprint powder.";
    u[76]="A non-corroding hard metal. It & Osmium are the densest elements. Used in labware, spark plug, pen tips & needles";
    u[77]="A non-corroding dense metal. Used in labware, spark plugs, pollution control, petroleum cracking & processing fats. Also a catalyst.";
    u[78]="A dense, non-tarnishing coloured metal & the most malleable element. Used in jewery, coins, ultra-thin gold leaf & electric contacts.";
    u[79]="A toxic metal, one of the 2 liquids. Used in thermometers, barometers, thermostats, street lamps, fluorescent lamps & dentistry.";
    u[80]="A soft, toxic metal. Used in low-melting-point mercury alloys, low-temperature thermometers, undersea lamps & photocells.";
    u[81]="A dense, toxic, non-corroding metal (first named 'Plumbum'[Pb]). Used in batteries, bullets, crystal glass & radiation shields.";
    u[82]="A low-melting-point brittle metal. Used in solders, fuses, fire sprinklers (plugs melt when hot) & cosmetics pigment.";
    u[83]="The first radioactive (and mostly long-lived) element found. Found in nature in small traces, antistatic brushes & tobacco.";
    u[84]="A short-lived radioactive element. Found in nature in small traces and cancer medicine.";
    u[85]="The only short-lived radioactive gas & an environmental hazard. Found in surgical implants for cancer treatment.";
    u[86]="A short-lived radioactive element with atoms larger than Cesium & are studied in laser atom traps. Small traces found in nature.";
    u[87]="A long-lived radioactive element. Found in luminous watches (now banned), medical radon production, radiography & radwaste.";
    u[88]="A long-lived radioactive element. Found in nature in small traces, cancer medicine, nuetron sources & radwaste.";
    u[89]="The most abundant radioactive element. Found in nuclear reactor fuel, gas lamp mantles, tungsten filaments & radwaste.";
    u[90]="A long-lived radioactive element. Found in nature in small traces & radwaste. No known use.";
    u[91]="A long-lived dense, radioactive element. Found in nuclear reactor fuel, nuclear weapons, counterweights & armor-piercing bullets.";
    u[92]="A long-lived radioactive element. Found in nature in small traces, neutron detectors, dosimeters, to-be nuclear weapons & radwaste.";
    u[93]="A long-lived radioactive element. Found in nature in small traces, nuclear reactor fuel, nuclear weapons & radwaste.";
    u[94]="A long-lived radioactive element, NEVER found in nature. Found in smoke detectors, sheet thickness gauges & radwaste.";
    u[95]="A long-lived radioactive element, NEVER found in nature. Found in scientific instruments, mineral analyzers & radwaste.";
    u[96]="A long-lived radioactive element, NEVER found in nature. Found in radwaste. No known use.";
    u[97]="A long-lived radioactive element, NEVER found in nature. Found in scientific instruments, mineral analyzers & radwaste.";
    u[98]="A short-lived radioactive element. NEVER found in nature. No known uses.";u[99]="A short-lived radioactive element. NEVER found in nature. No known uses.";
    u[100]="A short-lived radioactive element. NEVER found in nature. No known uses.";u[101]="A short-lived radioactive element. NEVER found in nature. No known uses.";
    u[102]="A short-lived radioactive element. NEVER found in nature. No known uses.";u[103]="A short-lived radioactive element. NEVER found in nature. No known uses.";
    u[104]="A short-lived radioactive element. NEVER found in nature. No known uses.";u[105]="A short-lived radioactive element. NEVER found in nature. No known uses.";
    u[106]="A short-lived radioactive element. NEVER found in nature. No known uses.";u[107]="A short-lived radioactive element. NEVER found in nature. No known uses.";
    u[108]="A short-lived radioactive element. NEVER found in nature. No known uses.";u[109]="A short-lived radioactive element. NEVER found in nature. No known uses.";
    u[110]="A short-lived radioactive element. NEVER found in nature. No known uses.";u[111]="A short-lived radioactive element. NEVER found in nature. No known uses.";
    u[112]="A short-lived radioactive element. NEVER found in nature. No known uses.";u[113]="A short-lived radioactive element. NEVER found in nature. No known uses.";
    u[114]="A short-lived radioactive element. NEVER found in nature. No known uses.";u[115]="A short-lived radioactive element. NEVER found in nature. No known uses.";
    u[116]="A short-lived radioactive element. NEVER found in nature. No known uses.";u[117]="A short-lived radioactive element. NEVER found in nature. No known uses.";
  }
  void display() {
    textAlign(CENTER, CENTER);textSize(sx/2);fill(191,191,255);rect(sx*0.25,sy*15,sx*2,sy*1);fill(255,255,0);rect(sx*2.5,sy*15,sx*2,sy*1);
    fill(255,0,0);rect(sx*0.25,sy*16.25,sx*2,sy*1);fill(255,63,255);rect(sx*2.5,sy*16.25,sx*2,sy*1);fill(0);
    text("Sort by:",sx*0,sy*14,sx*5,sy*0.75);textSize(sx/2.5);text("Groups",sx*0.2,sy*15,sx*2.2,sy*0.8);text("State",sx*2.4,sy*15,sx*2.2,sy*0.8);
    text("Radioact-\nivity",sx*0.3,sy*15.7,sx*2,sy*2);text("Naturallity",sx*2.4,sy*15.7,sx*2.2,sy*2);
    if(mouseX>sx*0.25&&mouseX<sx*2.25&&mouseY>sy*15&&mouseY<sy*16&&mousePressed) { o=1; } else
    if(mouseX>sx*2.5&&mouseX<sx*4.5&&mouseY>sy*15&&mouseY<sy*16&&mousePressed) { o=2; } else
    if(mouseX>sx*0.25&&mouseX<sx*2.25&&mouseY>sy*16.25&&mouseY<sy*17.25&&mousePressed) { o=3; } else
    if(mouseX>sx*2.5&&mouseX<sx*4.5&&mouseY>sy*16.25&&mouseY<sy*17.25&&mousePressed) { o=4; }
    noFill();strokeWeight(sx/5);if(o==1) { rect(sx*0.2,sy*14.95,sx*2.1,sy*1.1); } else if(o==2) { rect(sx*2.45,sy*14.95,sx*2.1,sy*1.1); }
    else if(o==3) { rect(sx*0.2,sy*16.2,sx*2.1,sy*1.1); } else if(o==4) { rect(sx*2.45,sy*16.2,sx*2.1,sy*1.1); } strokeWeight(1);
    for(int i = 0; i < ne; i++) {
      if(o==1) { fill(t[i]); } else if(o==2) { if(l[i]=="solid") { fill(255,255,0); } else if(l[i]=="liquid") { fill(191,191,255); }
      else if(l[i]=="gas") { fill(191,255,191); }} else if(o==3) { if(r[i]=="stable | safe") { fill(95,95,255); } 
      else if(r[i]=="long half-life | safe") { fill(127,191,127); } else if(r[i]=="long half-life | safe") {
      fill(0,127,127); } else if(r[i]=="half-life over 500 years | low health hazard") { fill(255,222,173); } else
      if(r[i]=="half-life over 1 day | potential high health risk") { fill(255,127,0); } else if
      (r[i]=="half-life over a few minutes | severe health risks") { fill(245,0,0); } else if(r[i]=="half-life < 1minute | deadly unless lab contained")
      { fill(167,15,19); }} else if(o==4) { if(p[i]=="natural, stable") { fill(255); } else if(p[i]=="natural (industrially extractable), radioactive")
      { fill(172,123,0); } else if(p[i]=="temporarily natural, radioactive") { fill(255,63,255); } else if(p[i]=="purely synthetic, radioactive") {
      fill(181,0,181); }} else { fill(255); } rect(at[i].x, at[i].y, sx*2, sy*2);
      textSize(sy/3); textAlign(LEFT); fill(0); text(i+1,at[i].x,at[i].y+sy/3);
      textSize(sy); textAlign(CENTER, CENTER); text(s[i],at[i].x,at[i].y-sx/3,sx*2,sy*2);
      fill(0);textSize(sx/3.7);textAlign(CENTER, BOTTOM);text(n[i],at[i].x,at[i].y,sx*2,sy*2);
    } for(int i = 0; i < ne; i++) {
    if(mouseX>at[i].x&&mouseX<at[i].x+sx*2&&mouseY>at[i].y&&mouseY<at[i].y+sy*2||(typedText.equals(char(int(n[i].charAt(0))+32)+n[i].substring(1,max(0,n[i].length())))||
    typedText.equals(char(int(s[i].charAt(0))+32)+s[i].substring(1,max(0,s[i].length())))||int(typedText)==(i+1))
    &&mouseX>sx*25.75&&mouseX<sx*33&&mouseY>sy/2&&mouseY<sy*1.5) {strokeWeight(sx/5);noFill();rect(at[i].x-sx/12,at[i].y-sy/12,sx*2+sx/6,sy*2+sy/6); strokeWeight(1);
      textSize(sx); text(n[i]+" ("+s[i]+")",sx*3.75,sy*-0.5,sx*25,sy*2); textSize(sx/1.75); textAlign(LEFT, TOP);
      text("Atomic Number: "+(i+1),sx*5,sy*0.75,sx*20,sy*1);text("Mass Number: "+m[i],sx*5,sy*1.5,sx*20,sy*1);
      text("Uses & info: "+u[i],sx*5,sy*4.5,sx*20,sy*3);String type = "(ungrouped)";
      if(t[i]==color(255,0,127)) { type = "Alkali Metals"; } else if(t[i]==color(255,0,255)) { type = "Alkaline Earths"; } else
      if(t[i]==color(191,191,255)) { type = "Transition Metals"; } else if(t[i]==color(127,255,127)) { type = "Lanthanides"; } else
      if(t[i]==color(255,0,0)) { type = "Actinides"; } else if(t[i]==color(255,127,0)) { type = "Basic Metals"; } else
      if(t[i]==color(0,191,0)) { type = "Semi-Metals"; } else if(t[i]==color(255,255,0)) { type = "Halogens"; } else
      if(t[i]==color(255,191,0)) { type = "Noble Gases"; } else if(t[i]==color(0,255,0)) { type = "Non-Metals"; }
      textAlign(RIGHT, CENTER);fill(t[i]);rect(sx*19,sy*1.5,sx*5.5,sy*1.5);fill(0);text("Group:\n"+type,sx*5,sy*1.25,sx*19,sy*1.75);
      if(l[i]=="solid") { fill(255,255,0); } else if(l[i]=="liquid") { fill(191,191,255); } else if(l[i]=="gas") { fill(191,255,191); }
      rect(sx*5,sy*2.25,sx*14,sy*0.75);textAlign(LEFT);fill(0);text("State of matter (under natural conditions): "+l[i],sx*5,sy*2.25,sx*20,sy*1);
      if(r[i]=="stable | safe") { fill(95,95,255); } else if(r[i]=="long half-life | safe") { fill(127,191,127); } else
      if(r[i]=="long half-life | safe") { fill(0,127,127); } else if(r[i]=="half-life over 500 years | low health hazard") { fill(255,222,173); } else
      if(r[i]=="half-life over 1 day | potential high health risk") { fill(255,127,0); } else if
      (r[i]=="half-life over a few minutes | severe health risks") { fill(245,0,0); } else if(r[i]=="half-life < 1minute | deadly unless lab contained")
      { fill(127,0,0); } rect(sx*5,sy*3,sx*19.5,sy*0.75);fill(0);text("Radioactivity Level: "+r[i],sx*5,sy*3,sx*20,sy*1);
      if(p[i]=="natural, stable") { fill(255); } else if(p[i]=="natural (industrially extractable), radioactive") { fill(172,123,0); } else
      if(p[i]=="temporarily natural, radioactive") { fill(255,63,255); } else if(p[i]=="purely synthetic, radioactive") { fill(181,0,181); }
      rect(sx*5,sy*3.75,sx*19.5,sy*0.75); fill(0);text("Naturallity: "+p[i],sx*5,sy*3.75,sx*20,sy*1); }
  } fill(255); rect(sx*25.75, sy*0.5, sx*7.25, sy); fill(255,0,0);textAlign(LEFT, CENTER);textSize(sy/2);text(typedText, sx*26, sy); }
}


