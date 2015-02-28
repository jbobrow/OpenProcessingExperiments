

int colonnes = 2;
int rangees = 3;
int etat = 1;
int pts = 0;
int pct = 0;
int pctt = 0;
int[] q  = new int[6]; //question
int[] r  = new int[6]; //reponse
int[] m  = new int[6]; //modifie
int[] bq  = new int[6]; //bloc de question
int[] br  = new int[6]; //bloc de reponse

color couleurQ1 = color(255, 255, 255);
color couleurQ2 = color(255, 255, 255);
color couleurQ3 = color(255, 255, 255);
color couleurQ4 = color(255, 255, 255);
color couleurQ5 = color(255, 255, 255);
color couleurR1 = color(255, 255, 255);
color couleurR2 = color(255, 255, 255);
color couleurR3 = color(255, 255, 255);
color couleurR4 = color(255, 255, 255);
color couleurR5 = color(255, 255, 255);
color couleurA1 = color(0);
color couleurA2 = color(0);
color couleurA3 = color(0);
color couleurA4 = color(0);
color couleurA5 = color(0);

String[] question = {
 "Quelles sont les quatre composantes de l’intelligence sexuelle ?  ", 
  "Qu’est-ce que l’approche biopsychosociale en sexologie ? ", 
  "Pour Mahomet, est-ce que la sexualité constitue la meilleure ou la pire chose de la vie humaine ?", 
  " Le taoïsme encourageait-il ou décourageait-il l’activité sexuelle ?", 
  "Quelle position sexuelle les Pères de l’Église catholique considéraient comme la seule naturelle ?", 
"Durant le Moyen-Âge, que symbolisaient les figures de Marie et d’Ève ? ", 
"Les réformateurs protestants du 16e siècle reconnurent-ils la valeur de la sexualité dans le mariage ? ", 
"Au siècle des Lumières (18e siècle), des femmes vont-elles revendiquer leurs droits sexuels ? ", 
"L’étude de Clelia Duel Mosher a-t-elle confirmé l’idée d’une asexualité chez les femmes de l’époque victorienne (19e siècle) ? ", 
"Selon l’étude de Kaeser (2006), quel est le pourcentage d’émissions recensées présentant un contenu sexuel ? ", 
"Comment se nomme le phénomène qui consiste à adopter des attitudes et des comportements exagérément sexualisés ? ", 
"Quels sont les axes de développement servant à l'analyse des phénomènes sexuels par la sexologie ? ", 
"Quels sont les buts de la sexologie ? ", 
"Quelle méthode de recherche non expérimentale a utilisé Alfred Kinsey ", 
"Quelle méthode de recherche non expérimentale a utilisé William Masters  ", 
" l’enquête de Laumann (1994) rapporte que les Américains sont plus ou moins satisfaits de leur vie sexuelle ", 
" l’enquête de Laumann (1994) rapporte que les Américains sont plus ou moins actifs sexuellement ", 
" l’enquête de Laumann (1994) rapporte que les Américains sont plus ou moins conservateurs ", 
"Comment se nomme la méthode de recherche sexologique qui se déroule en laboratoire ? ", 
"Est-ce que la  recherche expérimentale a établi un lien définitif entre la mesure de l’excitation physiologique et à l’intérêt sexuel ? ", 
"L’étude de Potdkar et Koenig (2005) montre que les adolescents mâles ont tendance à déclarer des comportements sexuels à risque lorsqu’ils utilisent le questionnaire assisté par ordinateur?",
"Quels sont les deux principaux critères évaluatifs qui devraient témoigner de la qualité d’une recherche sexologique ?",
"Quelle est la différence entre les mots « sexe » et « genre » ?",
"Que signifie l’expression « identité sexuelle » ?",
"Comment s’expriment les rôles sexuels ?",
"En quoi consiste le modèle interactionnel de la formation de l’identité sexuelle ?",
"Quel gène chromosomique jouerait un rôle important dans la séquence du développement gonadique masculin",
"Quel gène chromosomique jouerait un rôle important dans la séquence du développement gonadique féminin",
"Quelle substance chimique corporelle contribue au développement des organes génitaux externes ?",
"Existe-t-il des différences entre le cerveau de l’homme et de la femme ?",
"Quel terme utilise-t-on aujourd'hui pour désigner les personnes qui possèdent les caractères biologiques des deux sexes ?",
"Quelles sont les manifestations du syndrome de Klinefelter ?",
"Selon la théorie de l’apprentissage social, comment les parents influencentt-ils l’identification du rôle sexuel ?",
"Vers quel âge les enfants ont-ils déjà acquis une solide identité sexuelle ?",
"l’identité sexuelle est neutre au moment de la naissance et elle sera déterminée uniquement par des expériences d’apprentissage social ?",
"Est-ce que les personnes souffrant de dysphorie de genre désirent nécessairement changer de sexe ?",
"Quelle est la différence entre un travesti, un transsexuel et un transgenre ?",
"Quelle est la différence entre l’identité sexuelle et l’orientation sexuelle ?",
"Une fois le changement de sexe effectué, la plupart des personnes transsexuelles préfèrent-elles des partenaires sexuels de même sexe ou de l’autre sexe ?",
"Est-ce que le transsexualisme constitue une psychopathologie ?",
"Est-ce que les parents affichent un comportement plus ou moins protecteur à l’égard des bébés de sexe féminin ?",
"En quoi les stéréotypes de rôles sexuels sont-ils limitatifs et empêchentl’épanouissement sexuel ?",
"Qu’est-ce qui caractérise une personne androgyne ?",
 "Généralement, comment définit-on l’orientation sexuelle ?",
"étude de Lippa (2006), les FEMMES hétérosexuelles ont  plus de chance d’exprimer une attirance envers les personnes de leur propre sexe ? ",
"Selon l’enquête du NHSLS, combien de femmes et d’hommes se disaient homosexuels ?",
"Les femmes qui ont une plus forte libido sont-elles moins ou plus susceptibles d’être bisexuelles ?",
"La plupart des personnes homosexuelles ont leurs premières expériences sexuelles avec des personnes plus agées",
"l’étude de Bell (1981) a confirmé que l’homosexualité masculine est liée à une vie familiale particulière, soit à des relations père-fils déficientes ?",
"Est-ce que la recherche  semble indiquer qu’il y a une prédisposition biologique à l’homosexualité exclusive ?",
"Quelle est la différence entre la thérapie de réorientation et celle de l’affirmation de l’homosexualité ?",
"Est-ce que les hommes homophobes refoulent ou nient leurs émotions érotiques envers d’autres hommes ?",
"Quel symbole les Nazis ont obligé les hommes gais à porter sur leur manche ?",
"Quelles sont les trois étapes de l’affirmation de l’orientation sexuelle ?",
"Quels types d’attitudes ont les parents qui acceptent le mieux la révélation de l’homosexualité d’un membre de leur famille ?",
"Les couples homosexuels ont tendance à  se conformer aux attentes traditionnelles  concernant les rôles sexuels comparativement aux couples hétérosexuels ?",
"En quoi les motivations sexuelles des femmes homosexuelles se distinguent-elles de celles des hommes homosexuels ?",
"A-t-on observé des différences  significatives au plan du bien-être psychologique chez les jeunes adultes qui avaient été élevés par des mères lesbiennes et des mères hétérosexuelles ?",
"Est-ce que les stimulations tactiles du nourrisson peuvent déclencher uneréponse génitale ?",
"Les contacts chaleureux durant l’enfance ont-ils un impact sur l’expression de la sexualité de l’adulte ?",
"Selon l’enquête de Friedrich jusqu’à quel âge le nombre de comportements sexuels s’accroît-il chez les enfants ?",
"Selon l’enquête de Friedrich la fréquence des comportements sexuels observés chez les enfants est corrélée avec quelle variable ?",
"Les jeux sexuels avec des amis de même sexe durant l’enfance sont-ils déterminants de l’orientation sexuelle ?",
"Quelle hormone sécrétée par l’hypophyse stimule l’activité des gonades à la puberté ?",
"Quels rôles joue la masturbation durant l’adolescence ?",
"Quel comportement sexuel a augmenté de manière spectaculaire lors des jeux sexuels des adolescents ?",
"Statistique Canada, 2008, les adolescentes ayant une relation sexuelle a diminué ouaugmenté par rapport à 1995-1997 ?",
"Facteurs familiaux --> engagement plus tardif relations sexuelles coïtales chez les adolescentes ?",
"Les adolescents soupçonnés d’orientation homosexuelle risquent quels types de réactions sociales ?",
"Y a-t-il une hausse ou une baisse de personnes célibataires ?",
"Les études démontrent que les célibataires sont plus actifs et satisfaits sexuellement ?",
"Est-ce que les conjoints de fait ont des attitudes moins traditionnelles que les couples mariés quant aux rôles sexuels ?",
"Quelle est la fonction du mariage selon les cultures collectivistes et individualistes ?",
"Avec quelles variables la satisfaction sexuelle est-elle reliée chez les personnes mariées ?",
"Quelles sont les différences entre les partenaires fidèles et infidèles ?",
"Selon l’enquête de Dunn et Culter (2000), quelle proportion de personnes âgées de 60 ans et plus était sexuellement active ?",
"Une étude portant sur la satisfaction sexuelle des femmes de 50 ans et plus a identifié quel facteur de leur satisfaction sexuelle ?",
"Une étude a démontré que les 3/4 des homosexuels âgés se disaient satisfaits ou insatisfaits de leur vie sexuelle ?",
"Quelle est la différence entre l’abstinence sexuelle complète et partielle ?",
"Est-ce que les femmes qui ont tendance à avoir plus d’orgasmes nocturnes ont une fréquence de relations sexuelles moins plus grande que celles en ayant moins ?",
"Sur quoi portent généralement les fantasmes érotiques des femmes et deshommes ?",
"Selon Crépault (1998), quelles sont les caractéristiques des femmes ayant une vie fantasmatique riche ?",
"Hurlbert et Whittaker (1991) les femmes mariées qui se masturbent jusqu’à l’orgasme ont une satisfaction sexuelle  plus grande  ?",
"D’après Fillion (1996), quelles sont les différentes motivations  à une interaction sexuelle ?",
"Comment se nomme le Niveau +3 des interactions sexuelles de Maltz (2001) ?",
"Pourquoi le répertoire sexuel des homosexuels et des lesbiennes peut-il être plus riche et original que celui des hétérosexuels ?",
"Quel terme est utilisé pour désigner la stimulation buccale de la vulve ?",
"Selon l’étude de Lever (1994), quelle est la conduite sexuelle la plus répandue chez les homosexuels ?",
"Pour les femmes, le risque de contracter le virus du sida lors d’une relation anale est moins grand que lors d’une relation vaginale (non protégée) ?",
"Quelle est la position coïtale préférée des hommes et des femmes ?",
"Dans la sexualité tantrique, l’homme apprend  à retarder ou  à précipiter son propre orgasme ?",
"Humour toxique",
"Humour tonique",
"Quel est le nom de la théorie expliquant la motivation de Sylvie (dans la vidéo) à s’engager dans une activité sexuelle ?",
"À quel besoin Sylvie cherche-t-elle à répondre dans sa tentative de rapprochement sexuel ?",
"En quoi la sexologie se distingue-t-elle des autres disciplines qui s’intéressent à l’étude de la sexualité ?",
"Quels sont les trois champs de pratique de la  sexologie?",
"Quelles sont les différences entre la science de la sexualité et la science sexologique ?",
"Quels sont les effets de l’alcool sur la sexualité ?",
"Quelle est la différence entre les notions de « sexué » et de « sexuel » ?",
"Que signifie le terme « érotophilie » ?",
"Comment la personnalité érotophile se manifeste ?",
"Comment la personnalité érotophile se développe ?",
"Quelles sont les quatre dimensions de la vie sexuelle ?",
"Quelle est la différence entre démythifier et mythanalyser la sexualité ?",
"La vidéocassette sur les mythes sexuels confirme-t-elle le lien entre la taille du pénis et la race, selon certaines études ?",
"La vidéocassette sur les mythes sexuels confirme-t-elle l’influence de la taille du pénis sur le plaisir sexuel ?",
"La vidéocassette sur les mythes sexuels confirme-t-elle le lien entre la couleur des cheveux et le comportement sexuel ?",
"La vidéocassette sur les mythes sexuels confirme-t-elle le type d’école fréquentée (laïque ou religieuse) et l’intérêt sexuel ?",
"La vidéocassette sur les mythes sexuels confirme-t-elle la propriété spermicide du coca-cola ?",
"Quelle était la couleur des cheveux des prostituées dans la Rome antique ?",
"Quelle est la différence entre réussir et réaliser sa sexualité ?",
"Qu’est-ce qui distingue la période pré-scientifique de la période scientifique ?",
"Quelles sont les quatre grandes étapes du développement de la sexologie ?",
"Quelles  étaient les motivations du Dr Tissot en publiant un livre qui présente la masturbation comme une maladie ?",
"Selon le Dr Krafft-Ebing, quelles étaient les conséquences majeures de la masturbation ?",
"Pour quelles raisons Sylvester Graham et John Harvey  Kellog déconseillaient-ils la masturbation ?",
"D’après Freud, quelles sont les conséquences de la masturbation chez les adultes ?",
"Comment Havelock Ellis considérait-t-il la masturbation ?",
"Quel est le lien entre la masturbation et l’orgasme coïtal selon Kinsey ?",
"Quelle est l’utilité thérapeutique de la masturbation selon Masters et Jonhson ?",
"Est-ce que la masturbation est utilisée comme substitut en l’absence d’un partenaire sexuel ?",
"Est-ce que les personnes qui se masturbent ont plus ou moins d’activités sexuelles ?",
"Est-ce que la culpabilité atténue le recours à la masturbation chez les femmes et les hommes ?",
"Comment l’approche « cycle de vie » aborde-t-elle la sexualité ?",
"Quelle est la différence entre la vision statique et la vision dynamique de la sexualité ?",
"Quelle est la différence entre la vision négative et la vision positive de la sexualité ?",
"Quelle est la distinction entre les concepts d’identité sexuelle, d’orientation sexuelle et de rôle sexuel ?",
"Selon la perspective de la différenciation sexuelle, quand le développement sexué de la sexualité débute-t-il ?",
"La présence des chromosomes XY et XX chez le foetus témoigne de l’existence de quel type de sexe (gonadique, hormonal, génétique ou morphologique) ?",
"Comment se manifeste une identité sexuelle harmonieuse dans l’enfance ?",
"Comment reconnaît-on un jeune confronté à un trouble de l’identité sexuelle ?",
"Quel comportement doit-on adopter face à un jeune qui manifeste un trouble de l’identité sexuelle ? (Accompagnement)",
"Quel comportement doit-on adopter face à un jeune qui manifeste un trouble de l’identité sexuelle ? (Traitement)",
"Si un enfant a des parents homosexuels, risque-t-il de développer un trouble de l’identité sexuelle ?",
"Est-ce que les enfants de 3 à 5 ans se masturbent ?",
"Quel est l’âge moyen de la première relation sexuelle chez les garçons et les filles du Québec ?",
"Quelles sont les composantes du modèle idéal de la première relation sexuelle formulées par des étudiant-e-s d’une université française ?",
"Parmi la liste suivante, quels besoins sexuels physique, psychologique et social furent mentionnés en classe ?",
"Quelles sont les trois causes de la crise sexuelle identitaire au plan social ?",
"Quelles sont les manifestations de la crise identitaire ?",
"Que signifient le terme Normes Biologique",
"Que signifient le terme normes ?",
"Que signifient le terme Normes Statistique",
"Que signifient le terme Normes Psychologique",
"Que signifient le terme Normes Médicale",
"Que signifient le terme Normes Morale",
"Que signifient le terme Normes Sociale",
"Que signifient le terme normal ?",
"Que signifient le terme normalité ?",
"Que signifient le terme normaliser ?",
"Que signifient le terme normativité ?",
"Quelle est la différence entre la philosophie essentialiste et la philosophie existentialiste de la sexualité ?",
"Comment les perspectives essentialiste et existentialiste définissent-elles différemment la sélection du partenaire idéal ?",
"Est-ce que la théorie du scénario sexuel s’inscrit dans la philosophie essentialiste ou existentialiste ?",
"Est-ce que la théorie du scénario sexuel  conçoit la sexualité comme déterminée biologiquement ou acquise lors d’expériences de vie ?",
"Que signifie le « style sexuel » selon la théorie du scénario sexuel ?",
"Comment se nomme la modalité d’érotisation qui sert à érotiser une caractéristique d’une personne qu’on se représente comme un type ou un modèle admiré ?",
"En quoi le style androgyne témoigne-t-il de la sexualité post-moderne ?",
"Selon l’enquête du magazine Vogue en 1996, quels sont les traits physiques et psychologiques que les jeunes filles préfèrent chez les garçons ?",
"Que représente l’androgynie pour les personnes conservatrices ?",
"Quelles sont les deux valeurs post-modernes qui émergent de l’androgynie ?",
"Selon l’enquête menée en France en 1998, quels sont les deux comportements sexuels qui sont considérés comme les plus choquants par les répondants ?",
"Est-ce que les échangistes ont une vie conjugale insatisfaisante ?",
"Est-ce que les échangistes ont une vie sociale déviante ?",
"Est-ce que les échangistes ont une vie psychologique perturbée ?",
"Quelles sont les motivations pour fréquenter un club échangiste ?",
"Pourquoi l’infidélité n’est-elle pas acceptable ?",
"Quelles sont les définitions (dictionnaire et sexologique) du désir sexuel ?",
"Quel est le désir qui caractérise la sexualité adolescente ? ",
"Dans l’étude de Tremblay, quel énoncé témoigne le plus d’un désir sexuel hyperactif dans un contexte individuel ?",
"Dans l’étude de Tremblay, quel énoncé témoigne le plus d’un désir sexuel hyperactif dans un contexte relationnel ?",
"Étude de Tremblay : personnes vivant avec leur partenaire sexuel manifestent un désir sexuel plus faible ou plus élevé ?",
"Comment se nomme le neuropeptide libéré par l’hypothalamus qui contribue à transformer le désir en pulsion sexuelle ?",
"Selon Santé Canada, existe-t-il des aphrodisiaques pour stimuler le désir sexuel ?",
"Selon une recherche, quelle est la phrase qui reçoit le plus de réponse positive lors d’une tentative d’entrer en contact avec une personne étrangère ?",
"Comment se définit l’approche cognitive du désir sexuel ?",
"Dans l’histoire de cas présentée en classe, quel était l’erreur d’évaluation de la jeune fille de 18 ans qui se plaignait d’une inhibition du désir sexuel ?",
"D’après la démarche émotivo-rationnelle, quel est le facteur principal qui atténue le désir sexuel ?",
" D’après Michel Dorais, faut-il réduire ou amplifier l’ambiguïté au plan de l’identité sexuelle ?",
"Quelle serait la différence entre une sexologie réactionnaire et une sexologie émancipatrice par rapport aux normes sexuelles ?",
"Quels sont les trois types d’anormaux selon Foucault ?",
"En quoi consiste la normalisation pour Foucault ?",
"Quelle est la conception du pathologique chez Canguilhem ?",
"Est-ce que la Cour suprême du Canada a reconnu ou  non la légalité des clubs échangistes ?",
"Quelle est la différence entre le contrôle externe et interne de la vie sexuelle par rapport aux attitudes face aux normes sexuelles?",

}; 

String[] reponse = {  
  "Connaissance de sa propre sexualité, établir des rapports interpersonnels, connaissance scientifique de la sexualité, compréhension du contexte sexuel", 
  "Qui se rapporte à une combinaison de facteurs biologiques, psychologiques et sociaux.", 
  "La meilleure", 
  "Encouragait, favorisant des pratiques diverses comme permettant l'accord des énergie masculines et féminines", 
  "L'homme couché sur la femme, dite du missionaire", 
  "La vierge, inatteignable, et la temptatrice. ", 
"Oui,cela nuançait les notions de pêché et de procréation. ", 
"Oui, mais dans une mesure marginale par rapport aux avancées à venir ", 
"Non, au contraire elle allait à contre-courant de l'idée reçue à l'époque ", 
"70% ", 
"Hypersexualisation ", 
"Bio-sexologie, Psycho-sexologie, Socio-sexologie, Sexologie appliquée ", 
"Compréhension et prédiction des comportements, élaboration de moyens d'intervention ", 
"Enquête ", 
"Observation directe ", 
"plus satisfait ", 
"moins actifs ", 
"plus conservateurs ", 
"La méthode expérimentale ", 
"Non, on peut être exité par quelque chose qui ne nous intéresse pas ", 
"Ils déclarent plus facilement les comportements à risque lors d'un questionnaire informatisé",
"Crédibilité des chercheurs et moyen de diffusion",
"Sexe réfère au sexe biologique et genre au sentiment d'appartenance sexuelle",
"Sentiment d'appartenir ou non à son sexe biologique",
"Par une série d'attitudes et de comportements considérés comme apppropriés dans une culture donnée.",
"L'identité sexuelle est issu de facteurs innés et acquis.",
"Chromosomes X et Y",
"Deux chromosomes X",
"Substance inhibitrice de Müller (SIM)",
"Oui. Grosseur, hypothalamus, les hémisphères cérébraux droit et gauche et le corps calleux.",
"Intersexué (autrefois hermaphrodite)",
"Testicule et Pénis sous-dévellopés , légères formes féminines, infertilité",
"Communiquent leurs attentes à l'enfant qui s'y identifie.",
"3 ans",
"Certains cas tendent à démontrer que l'aspect biologique entre en ligne de compte",
"Pas nécessairement, elle peuvent vouloir simplement l'apparence physique, l'identité socioculturelle ou la sexualiét de l'autre sexe",
"Le travesti s'habille comme l'autre sexe, le transsexuel à le sentiment d'appartenir à l'autre sexe et le transgenre transgresse les norme sociale de ce que devrait être son sexe.",
"L'appartenance à un sexe, qu'il soit biologique ou pas. L'attirance vers un sexe, qu'il soit opposé ou pas.",
"Généralement de l'autre sexe, plus ambiguë chez l'homme devenu femme",
"Non.",
"Plus protecteur et plus strict.",
"Les individus incarnent des rôles attendus plutôt que leur propre nature.",
"Présente des comportements typiquement féminin et masculin",
"Attirance sexuelle vers le sexe opposé, le même sexe, les deux ou abscence d'attirance.",
"Énormément plus",
"1.4% femmes, 2.8% hommes",
"Plus susceptibles",
"Leur propre groupe d'âge",
"Non, ce sans rejeter une insidence possible dans certains cas.... ",
"Oui, corrélation entre le niveau de rapprochement génétique des jumeaux et l'insidence d'homosexualité concordante.",
"Une aide à changer d'orientation, l'autre aide à faire face aux attitudes sociales négatives",
"Oui, il cherchent à se rassurer sur leur orientation",
"Triangle rose",
"La reconnaissance de soi, l'acceptation de soi, la révélation",
"Moins conservatrices et rigides.",
"Non, ils sont influencé par le modèle dominant mais sont généralement plus souple par rapport à celui-ci",
"Recherche de l'intimité affective avant l'intimité physique.",
"Non, mère lesbiennes et  hétérosexuelles équivalentes",
"Oui, elles le peuvent",
"Oui, quoique les modèles diffèrent",
"5ans",
"L'absence de réprobation de la part de la mère",
"Non, tout au plus peuvent-ils être précurseurs",
"Gonadostimuline",
"Exutoire et moyen d'apprendre à comprendre son propre corps (potentiel sexuel, plaisir)",
"Rapports buccogénitaux",
"Diminution marquée (51% à 43%)",
"Religion, réprobation familiale, les attentes parentales, une situation socio-éconmique favorable, la conviction d'être aimé par un adulte.",
"Hostilité, isolation, incompréhension",
"Hausse (tendance constante)",
"Tendance à être moins dans les 2 cas.",
"Oui. Moins traditionnelle",
"Dans le premier cas former un maillage de la famille étendue, dans le deuxième les désirs et buts personnels prennent le dessus",
"Le temps (s'étiole), l'orgasme et les attentes",
"Généralement, plus grand intérêt sexuel, consommation de drogue récréative, milieu propisce aux rencontres, peu religieux.",
"La moitié",
"Satisfaction conjugale, (ensuite orgasme, fréquence)",
"Satisfaits",
"La masturbation",
"Plus grande",
"Un partenaire différent, une relation antérieure, contenu pornographique, relation buccogénitale.",
"Scolarisées, masturbation active et préccoce, orgasmiques et satisfaites",
"Oui, plus grande satisfaction",
"La sexualité peut exprimer et signifier n'importe quoi",
"Intimité sexuelle authentique",
"Moins centré sur la génitalité",
"Cunnilingus",
"S'étreindre, s'embrasser, se blottir l'un contre l'autre, se caresser tout le corps",
"Non, plus grand",
"Les deux préfèrent leur partenaire par-dessus",
"Retarder",
"Dénigrer, se moquer des différence (homosexualité) peur, haine, angoisse exprimée",
"Rôle normatif, passer des messages. Contrôle social. Inibiation, ouverture.",
"Théorie de l'attachement",
"Un besoin de réconciliation, anxiété comme moteur du désir",
"Distincte par son approche multidisciplinaire, (aspects physiques, psychiques, biologiques, historiques, sociales, philosophiques). Intégration prenant la forme d'une synthèse permet d'avoir un point de vue complet sur la sexualité.",
"Thérapie (problèmes sexuels) Éducation (aider les gens à s'approprier leur sexualité) Recherche",
"science de la sexualité = SPÉCIALISATION science sexologique = SCIENCE AUTONOME",
"Effet sur le système nerveux, cellules, impact sur le comportement Inhibition, sous-performance",
"Sexué : différence entre les sexes; caractéristiques F et M Sexuel : Fait référence au plaisir; à l'érotisme",
"Porté sur le sexe, tendance à être attiré par l'érotisme",
"Curiosité, ouverture sur la sexualité, s'interroger, explorer, s'informer, connaissance, attitude, comportements",
"Milieu, environnement, apprentissage, socialisation (démarche personnelle)",
"Une organisation complexe, Une structure intégrée, Un processus évolutif, Un projet à réaliser",
"Démythification : Dénoncer une imposture, une déformation de la réalité Mythanalyse : Étudier les mythes pour comprendre la sexualité",
"Oui, selon certaines études",
"Non, ça n'influnce pas",
"Non, il n'y a pas de lien",
"Non, type indiférent",
"Non (come on)",
"Blonds",
"La perception d'une personne de vivre un état de bien-être sexuel qui s'exprime par l'adoption d'un style de vire individuel et relationnel qui permet de satisfaire ses besoins sexuels.",
"Scientifiques : Cadre de la science précis et sérieux, donc période PRÉ-scientifique manque d'objectivité (précision) et de sérieux.",
"1) Recherche peu coordonnées 2) Savoir cohérent, Fondation de la sexologie 3) Fonctionnement normal 4) Révolution scientifique",
"Prévenir la population et prévenir la dégénération (amène des faiblesses, empêche le dévellopement, perte de cheveux, pustules, lol)",
"Porte d'entrée de la pathologie sexuelle (folie). Pathologie héréditaire se développant via la masturbation",
"Danger d'épuisement.",
"Signe d'immaturité. Problème issu de l'enfance ET propre à l'enfance, comportement immature signe de pathologie. ",
"Auto-érotisme bénifique. Pas dangereuse. Libéré de la culpabilité associée à l'éjaculation nocturne, considère qu'il n'y a que des avantages (relaxation).",
"Apprentissage de l'orgasme. Orgasme de masturbation favorise l'orgasme coïtal.",
"Utilisé en thérapie : Découvrir l'orgasme. Favorise l'orgasme avec un partenaire.",
"Majorité des gens ont répondu : non. Masturbation n'est pas compagnon mais comportement secondaire",
"Les gens qui se masturbent ont plus d'activités sexuelles que ceux qui ne le font pas. Lien avec érotophilie.",
"Chez les femmes, pas chez les hommes...",
"Enfant-Ado-Adulte-Age d'or-Sénilité. Succession de changements de la naissance à la mort. Concevoir la sexualité comme un voyage",
"Statique : Sexualité, c'est inné. Se développe jusqu'à l'adolescence puis se stabilise Dynamique : À toutes les périodes de la vie, il y a des changements, évolution",
"Négative : La sexualité diminue et meurt avec l'âge. Période moins intéressante Positive : Chaque période a quelque chose d'intéressant",
"Identité : Sentiment d'appartenir à un sexe Rôle : les attitudes et traits qu'une société définit M/F Orientation : Le sexe vers lequel l'individu est affectivement et sexuellement attiré",
"Commence avant la naissance, dès la fécondation.",
"XY masculin XX féminin",
"À l'aise dans son corps sexué et sexuel, heureux d'appartenir à son sexe, est reconnu comme fille ou garçon",
"Identification forte et persistante à l'autre sexe, vouloir porter les vêtements du sexe opposé, inconfort permanent à l'égard de son sexe.",
"Résoudre les problèmes colatéraux, Réduire le stress du TISE, Soutenir l'enfant et la famille dans leurs choix, Encourager la tolérance face à l'incertitude et l'anxiété",
"Développer des relations positives avec le père, les amis, Acquérir des habilités et habitudes caractéristiques de son sexe, Intégrer des groupes de son sexe, Apprécier son appartenance sexuelle",
"Non, pas d'incidence",
"Oui, exploration",
"Environ 15-16 ans",
"Physique : Pas de douleur, techniquement satisfaisant Psychique : Climat, cadre, consentement Social : Lieux, partenaire, communication aux parents",
"Physique : Sensations, Exitations, Conscience corporelle Psychique : Appartenance, Autonomie, Expérimentation Social : Communication, Reconnaissance, Repères",
"Émancipation féminine : remise en question de la sexualité Rationalisation économique Privatisation des croyances",
"Dépression Agressivité",
"Être de sexe masculin ou féminin Être reproductif",
"Les normes sont utilisées pour donner des directives et des points de repère (médecine, morale).",
"Être comme la plupart du monde, Être dans la moyenne",
"Être adapté Être équilibré",
" Être sain Être bien",
" Être bon Être respectueux",
"Être consentant Être réservé",
"-Etre comme la majorité Etre dans la moyenne, Etre adapté Etre equilibré Etre sain (medecine) et etre bien",
"Respecter une règle de comportement dans un cadre donné Etre ds la norme, une manière d'être",
"Appliquer la norme (discipliner)",
"Générer des normes",
"Déterminé vs Indéterminé Biologique vs Social Naturalisation vs Socialisation Singularité vs pluralité Deter. Intrinsèque vs Deter. Extrinsèque",
"Besoin de se reproduire, bon géniteur, sélection naturelle Selection culturelle (être bien) sexuellement socialement",
"Existentiel, C'est appris, culturel",
"Acquise lors de l'expérience de vie",
"Manière particulière de jouer son rôle d'acteur sexuel",
"Amplifie l'ambiguité",
"1 Symbiose des 2 sexes, 2 Amplitude de Ipo à Hypersexualité, 3 Identité ambiguë, mobile 4Deviance sexuelle",
"Gars mince; Non musclé, Naturel; Authentique",
"Réaction négatives : Intolérance, non-respect des minorités",
"Réaction positives : Tolérance, respect des minorités",
"-Fréquenter un club échangiste -Tromper son conjoint",
"non, elle est satisfaisante",
"non, pas de tendances déviantes",
"non, psychologiquement équilibré",
"Éviter la monotonie. Rencontrer des gens. Narcissisme, se faire apprécier",
"Pour certaines personnes c'est hors-norme (bris de contrat)",
"Tendance consciente aux plaisirs sexuels. Ressenti objectif causé par des facteurs internes et externes à l'individu pouvant résulter en des comportements sexuels",
"Désir d'aimer et d'être aimé",
"Il m'arrive d'avoir envie de me masturber",
"J'ai envie de faire des avances sexuelles à mon partenaire ou à une personne qui m'attire",
"Moins élévée – Plus faible (habitude)",
"Lubérine",
"Non, aucun n'est reconnu",
"J'aimerais faire ta connaissance",
"Le désir sexuel dépend des perceptions et d'évaluation qu'on se fait",
"Un jugement d'obligation.",
"Les idées irrationnelles",
"Amplifier l’ambiguité au plan de l’identité sexuelle. ",
"Réactionnaire : Qui impose des normes Émancipatrice : Aider les gens à trouver leurs normes. ",
"1- Monstre physique et psychologique  2-Criminels (hors norme) 3- Masturbateur (se contenter de lui-même au lieu de partenaire)",
"C’est d’appliquer une discipline. Rendre normal en créant… Identifier et corriger l’anormalité",
"C’est l’incapacité (ou refus) de renouveler les normes. Manquer d’imagination. ",
"Oui, c’est légal. ",
"Externe : Se soumettre à des normes. Interne : Construction personnelle de normes impliquant le processus de réflexion. ",

};  

int rand1 = (int)random(question.length);
int rand2 = (int)random(question.length);
int rand3 = (int)random(question.length);
int rand4 = (int)random(question.length);
int rand5 = (int)random(question.length);
int rand1modif = rand1;
int rand2modif = rand2;
int rand3modif = rand3;
int rand4modif = rand4;
int rand5modif = rand5;
int swap = 0;


void setup() {
  size(800, 700);
  smooth();
  noStroke();
  int swap = (int)random(5);

  for (int i = 1; i < q.length; i++ ) {
    q[i] = 0;
    r[i] = 0;
    bq[i] = 0;
    br[i] = 0;
  }

  for (int i = 1; i < m.length; i++ ) {
    m[i] = i;
  }

  while (rand1 == rand2) {
    rand2 = (int)random(question.length);
  }

  while (rand3 == rand2 || rand3 == rand1) {
    rand3 = (int)random(question.length);
  }

  while (rand4 == rand2 || rand3 == rand4 || rand4 == rand1) {
    rand4 = (int)random(question.length);
  }

  while (rand5 == rand2 || rand3 == rand5 || rand4 == rand5 || rand5 == rand1) {
    rand5 = (int)random(question.length);
  }

  //println(question[1]);
  // println(reponse[1]);
}
void draw() { 

  fill(220);
  rect(0, 0, width, height);

  /*rand1modif = rand2;
   rand2modif = rand3;  
   rand3modif = rand4;
   rand4modif = rand1;
   rand5modif = rand5;
   
   m[1] = 2;
   m[2] = 3;
   m[3] = 4;
   m[4] = 1;
   m[5] = 5;*/

  println(swap);
  if (swap==0) {
    println("zéro");
    rand1modif = rand5;
    rand2modif = rand1;  
    rand3modif = rand4;
    rand4modif = rand3;
    rand5modif = rand2;

    m[1] = 5;
    m[2] = 1;
    m[3] = 4;
    m[4] = 3;
    m[5] = 2;
  }

  if (swap==1) {
    println("un");
    rand1modif = rand2;
    rand2modif = rand3;  
    rand3modif = rand4;
    rand4modif = rand1;
    rand5modif = rand5;

    m[1] = 2;
    m[2] = 3;
    m[3] = 4;
    m[4] = 1;
    m[5] = 5;
  }
  if (swap==2) {
    println("deux");
    rand1modif = rand1;
    rand2modif = rand5; 
    rand3modif = rand2;
    rand4modif = rand3;
    rand5modif = rand4;

    m[1] = 1;
    m[2] = 5;
    m[3] = 2;
    m[4] = 3;
    m[5] = 4;
  }
  if (swap==3) {
    println("trois");
    rand1modif = rand4;
    rand2modif = rand5; 
    rand3modif = rand3;
    rand4modif = rand2;
    rand5modif = rand1;

    m[1] = 4;
    m[2] = 5;
    m[3] = 3;
    m[4] = 2;
    m[5] = 1;
  }
  if (swap==4) {
    println("quatre");
    rand1modif = rand2;
    rand2modif = rand1;
    rand3modif = rand4;
    rand4modif = rand5;
    rand5modif = rand3;

    m[1] = 2;
    m[2] = 1;
    m[3] = 4;
    m[4] = 5;
    m[5] = 3;
  }


  if (etat <=2) {

    // Dessin des blocs

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA1);
      strokeWeight(20);
    }
    fill(couleurQ1);
    rect(10, 10, 370, 100);

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA2);
      strokeWeight(20);
    }
    fill(couleurQ2);
    rect(10, 120, 370, 100);

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA3);
      strokeWeight(20);
    }
    fill(couleurQ3);
    rect(10, 230, 370, 100);

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA4);
      strokeWeight(20);
    }
    fill(couleurQ4);
    rect(10, 340, 370, 100);

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA5);
      strokeWeight(20);
    }
    fill(couleurQ5);
    rect(10, 450, 370, 100);

    //------------------------

    stroke(0);
    fill(255);
    rect(10, 560, 200, 75);
    
    textAlign(CENTER);
    textSize(16);
    fill(0);
    text("VÉRIFIER", 20, 570, 200, 80);

    //---------------------

    stroke(0);
    fill(couleurR1);
    rect(420, 10, 370, 100);

    stroke(0);
    fill(couleurR2);
    rect(420, 120, 370, 100);

    stroke(0);
    fill(couleurR3);
    rect(420, 230, 370, 100);

    stroke(0);
    fill(couleurR4);
    rect(420, 340, 370, 100);

    stroke(0);
    fill(couleurR5);
    rect(420, 450, 370, 100);



    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand1], 20, 20, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand2], 20, 130, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand3], 20, 240, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand4], 20, 350, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand5], 20, 460, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand1modif], 420, 20, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand2modif], 420, 130, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand3modif], 420, 240, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand4modif], 420, 350, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand5modif], 420, 460, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(pts, 515, 600);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text("/5", 530, 600);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(pct, 620, 600);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text("/", 630, 600);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(pctt, 640, 600);
  }
}
void mouseReleased() {
  if (etat ==1) {
    if (mouseX >10 && mouseX < 380 && mouseY >10 && mouseY < 110) {
      if (bq[1] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 1;
          bq[1] =5;
          couleurQ1 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 1;
          bq[1] =4;
          couleurQ1 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 1;
          bq[1] =3;
          couleurQ1 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 1;
          bq[1] =2;
          couleurQ1 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 1;
          bq[1] =1;
          couleurQ1 = color(0, 255, 255);
        }
      }
      else {
        if (bq[1] ==1) {
          q[1] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
        if (bq[1] ==2) {
          q[2] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
        if (bq[1] ==3) {
          q[3] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
        if (bq[1] ==4) {
          q[4] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
        if (bq[1] ==5) {
          q[5] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >10 && mouseX < 380 && mouseY >120 && mouseY < 220) {
      if (bq[2] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 2;
          bq[2] =5;
          couleurQ2 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 2;
          bq[2] =4;
          couleurQ2 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 2;
          bq[2] =3;
          couleurQ2 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 2;
          bq[2] =2;
          couleurQ2 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 2;
          bq[2] =1;
          couleurQ2 = color(0, 255, 255);
        }
      }
      else {
        if (bq[2] ==1) {
          q[1] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
        if (bq[2] ==2) {
          q[2] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
        if (bq[2] ==3) {
          q[3] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
        if (bq[2] ==4) {
          q[4] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
        if (bq[2] ==5) {
          q[5] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >10 && mouseX < 380 && mouseY >230 && mouseY < 330) {
      if (bq[3] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 3;
          bq[3] =5;
          couleurQ3 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 3;
          bq[3] =4;
          couleurQ3 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 3;
          bq[3] =3;
          couleurQ3 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 3;
          bq[3] =2;
          couleurQ3 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 3;
          bq[3] =1;
          couleurQ3 = color(0, 255, 255);
        }
      }
      else {
        if (bq[3] ==1) {
          q[1] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
        if (bq[3] ==2) {
          q[2] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
        if (bq[3] ==3) {
          q[3] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
        if (bq[3] ==4) {
          q[4] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
        if (bq[3] ==5) {
          q[5] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >10 && mouseX < 380 && mouseY >340 && mouseY < 440) {
      if (bq[4] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 4;
          bq[4] =5;
          couleurQ4 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 4;
          bq[4] =4;
          couleurQ4 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 4;
          bq[4] =3;
          couleurQ4 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 4;
          bq[4] =2;
          couleurQ4 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 4;
          bq[4] =1;
          couleurQ4 = color(0, 255, 255);
        }
      }
      else {
        if (bq[4] ==1) {
          q[1] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
        if (bq[4] ==2) {
          q[2] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
        if (bq[4] ==3) {
          q[3] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
        if (bq[4] ==4) {
          q[4] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
        if (bq[4] ==5) {
          q[5] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >10 && mouseX < 380 && mouseY >450 && mouseY < 550) {
      if (bq[5] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 5;
          bq[5] =5;
          couleurQ5 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 5;
          bq[5] =4;
          couleurQ5 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 5;
          bq[5] =3;
          couleurQ5 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 5;
          bq[5] =2;
          couleurQ5 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 5;
          bq[5] =1;
          couleurQ5 = color(0, 255, 255);
        }
      }
      else {
        if (bq[5] ==1) {
          q[1] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
        if (bq[5] ==2) {
          q[2] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
        if (bq[5] ==3) {
          q[3] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
        if (bq[5] ==4) {
          q[4] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
        if (bq[5] ==5) {
          q[5] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
      }
    }

    //---------------------Réponses

    if (mouseX >420 && mouseX < 790 && mouseY >10 && mouseY < 110) {
      if (br[1] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 1;
          br[1] =5;
          couleurR1 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 1;
          br[1] =4;
          couleurR1 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 1;
          br[1] =3;
          couleurR1 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 1;
          br[1] =2;
          couleurR1 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 1;
          br[1] =1;
          couleurR1 = color(0, 255, 255);
        }
      }
      else {
        if (br[1] ==1) {
          r[1] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
        if (br[1] ==2) {
          r[2] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
        if (br[1] ==3) {
          r[3] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
        if (br[1] ==4) {
          r[4] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
        if (br[1] ==5) {
          r[5] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >420 && mouseX < 790 && mouseY >120 && mouseY < 220) {
      if (br[2] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 2;
          br[2] =5;
          couleurR2 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 2;
          br[2] =4;
          couleurR2 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 2;
          br[2] =3;
          couleurR2 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 2;
          br[2] =2;
          couleurR2 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 2;
          br[2] =1;
          couleurR2 = color(0, 255, 255);
        }
      }
      else {
        if (br[2] ==1) {
          r[1] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
        if (br[2] ==2) {
          r[2] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
        if (br[2] ==3) {
          r[3] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
        if (br[2] ==4) {
          r[4] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
        if (br[2] ==5) {
          r[5] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >420 && mouseX < 790 && mouseY >230 && mouseY < 330) {
      if (br[3] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 3;
          br[3] =5;
          couleurR3 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 3;
          br[3] =4;
          couleurR3 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 3;
          br[3] =3;
          couleurR3 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 3;
          br[3] =2;
          couleurR3 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 3;
          br[3] =1;
          couleurR3 = color(0, 255, 255);
        }
      }
      else {
        if (br[3] ==1) {
          r[1] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
        if (br[3] ==2) {
          r[2] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
        if (br[3] ==3) {
          r[3] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
        if (br[3] ==4) {
          r[4] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
        if (br[3] ==5) {
          r[5] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >420 && mouseX < 790 && mouseY >340 && mouseY < 440) {
      if (br[4] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 4;
          br[4] =5;
          couleurR4 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 4;
          br[4] =4;
          couleurR4 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 4;
          br[4] =3;
          couleurR4 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 4;
          br[4] =2;
          couleurR4 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 4;
          br[4] =1;
          couleurR4 = color(0, 255, 255);
        }
      }
      else {
        if (br[4] ==1) {
          r[1] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
        if (br[4] ==2) {
          r[2] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
        if (br[4] ==3) {
          r[3] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
        if (br[4] ==4) {
          r[4] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
        if (br[4] ==5) {
          r[5] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >420 && mouseX < 790 && mouseY >450 && mouseY < 550) {
      if (br[5] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 5;
          br[5] =5;
          couleurR5 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 5;
          br[5] =4;
          couleurR5 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 5;
          br[5] =3;
          couleurR5 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 5;
          br[5] =2;
          couleurR5 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 5;
          br[5] =1;
          couleurR5 = color(0, 255, 255);
        }
      }
      else {
        if (br[5] ==1) {
          r[1] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
        if (br[5] ==2) {
          r[2] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
        if (br[5] ==3) {
          r[3] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
        if (br[5] ==4) {
          r[4] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
        if (br[5] ==5) {
          r[5] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
      }
    }
  }

  //---vérifie

  if (mouseX >10 && mouseX < 210 && mouseY >560 && mouseY < 635) {
    if (etat ==2) { 
      etat =3;
    }
    if (etat ==1) { 
      couleurA1 = color(255, 0, 0);
      couleurA2 = color(255, 0, 0);
      couleurA3 = color(255, 0, 0);
      couleurA4 = color(255, 0, 0);
      couleurA5 = color(255, 0, 0);
      etat =2;
      if (q[1]==m[r[1]]) {
        pts += 1;
        println("q1");

        if (bq[1] == 1) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 1) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 1) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 1) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[5] == 1) {
          couleurA5 = color(0, 255, 0);
        }
      }
      if (q[2]==m[r[2]]) {
        pts += 1;
        println("q2");
        if (bq[1] == 2) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 2) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 2) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 2) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[5] == 2) {
          couleurA5 = color(0, 255, 0);
        }
      }

      if (q[3]==m[r[3]]) {
        pts += 1;
        println("q3");
        if (bq[1] == 3) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 3) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 3) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 3) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[5] == 3) {
          couleurA5 = color(0, 255, 0);
        }
      }

      if (q[4]==m[r[4]]) {
        pts += 1;
        println("q4");
        if (bq[1] == 4) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 4) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 4) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 4) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[4] == 4) {
          couleurA5 = color(0, 255, 0);
        }
      }

      if (q[5]==m[r[5]]) {
        pts += 1;
        println("q5");
        if (bq[1] == 5) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 5) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 5) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 5) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[5] == 5) {
          couleurA5 = color(0, 255, 0);
        }
      }
      pct += pts;
      pctt += 5;
    } 
    if (etat ==3) { 
      pts = 0;
      etat =1;
      swap = (int)random(5);

      for (int i = 1; i < q.length; i++ ) {
        q[i] = 0;
        r[i] = 0;
        bq[i] = 0;
        br[i] = 0;
      }

      for (int i = 1; i < m.length; i++ ) {
        m[i] = i;
      }

      while (rand1 == rand2) {
        rand2 = (int)random(question.length);
      }

      while (rand3 == rand2 || rand3 == rand1) {
        rand3 = (int)random(question.length);
      }

      while (rand4 == rand2 || rand3 == rand4 || rand4 == rand1) {
        rand4 = (int)random(question.length);
      }

      while (rand5 == rand2 || rand3 == rand5 || rand4 == rand5 || rand5 == rand1) {
        rand5 = (int)random(question.length);
      }


      rand1 = (int)random(question.length);
      rand2 = (int)random(question.length);
      rand3 = (int)random(question.length);
      rand4 = (int)random(question.length);
      rand5 = (int)random(question.length);
      rand1modif = rand1;
      rand2modif = rand2;
      rand3modif = rand3;
      rand4modif = rand4;
      rand5modif = rand5;
      couleurQ1 = color(255, 255, 255);
      couleurQ2 = color(255, 255, 255);
      couleurQ3 = color(255, 255, 255);
      couleurQ4 = color(255, 255, 255);
      couleurQ5 = color(255, 255, 255);
      couleurR1 = color(255, 255, 255);
      couleurR2 = color(255, 255, 255);
      couleurR3 = color(255, 255, 255);
      couleurR4 = color(255, 255, 255);
      couleurR5 = color(255, 255, 255);

      for (int i = 1; i < q.length; i++ ) {
        q[i] = 0;
        r[i] = 0;
        bq[i] = 0;
        br[i] = 0;
      }

      for (int i = 1; i < m.length; i++ ) {
        m[i] = i;
      }

      while (rand1 == rand2) {
        rand2 = (int)random(question.length);
      }

      while (rand3 == rand2 || rand3 == rand1) {
        rand3 = (int)random(question.length);
      }

      while (rand4 == rand2 || rand3 == rand4 || rand4 == rand1) {
        rand4 = (int)random(question.length);
      }

      while (rand5 == rand2 || rand3 == rand5 || rand4 == rand5 || rand5 == rand1) {
        rand5 = (int)random(question.length);
      }
    }
  }
}

