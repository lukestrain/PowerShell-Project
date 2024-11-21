<#
.Synopsis
The idea for this module is to create custom PSObjects for each Pokemon, then create commands to generate a key, encrypt or decrypt based on those pokemon objects.

.Parameter 







#>


class Pokemon {
    
    #Attributes
    [ValidateNotNullOrEmpty()][string]$Name
    [ValidateNotNullOrEmpty()][int]$Number
    [ValidateNotNullOrEmpty()][string]$Entry
}
$PokedexData = @(
[PSCustomObject]@{DexNumber = 1; Name = 'Bulbasaur'; DexEntry = "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON."},
[PSCustomObject]@{DexNumber = 2; Name = 'Ivysaur'; DexEntry = "When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs."},
[PSCustomObject]@{DexNumber = 3; Name = 'Venusaur'; DexEntry = "The plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight."},
[PSCustomObject]@{DexNumber = 4; Name = 'Charmander'; DexEntry = "Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail."},
[PSCustomObject]@{DexNumber = 5; Name = 'Charmeleon'; DexEntry = "When it swings its burning tail, it elevates the temperature to unbearably high levels."},
[PSCustomObject]@{DexNumber = 6; Name = 'Charizard'; DexEntry = "Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally."},
[PSCustomObject]@{DexNumber = 7; Name = 'Squirtle'; DexEntry = "After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth."},
[PSCustomObject]@{DexNumber = 8; Name = 'Wartortle'; DexEntry = "Often hides in water to stalk unwary prey. For swimming fast, it moves its ears to maintain balance."},
[PSCustomObject]@{DexNumber = 9; Name = 'Blastoise'; DexEntry = "A brutal POKéMON with pressurized water jets on its shell. They are used for high speed tackles."},
[PSCustomObject]@{DexNumber = 10; Name = 'Caterpie'; DexEntry = "Its short feet are tipped with suction pads that enable it to tirelessly climb slopes and walls."},
[PSCustomObject]@{DexNumber = 11; Name = 'Metapod'; DexEntry = "This POKéMON is vulnerable to attack while its shell is soft, exposing its weak and tender body."},
[PSCustomObject]@{DexNumber = 12; Name = 'Butterfree'; DexEntry = "In battle, it flaps its wings at high speed to release highly toxic dust into the air."},
[PSCustomObject]@{DexNumber = 13; Name = 'Weedle'; DexEntry = "Often found in forests, eating leaves. It has a sharp venomous stinger on its head."},
[PSCustomObject]@{DexNumber = 14; Name = 'Kakuna'; DexEntry = "Almost incapable of moving, this POKéMON can only harden its shell to protect itself from predators."},
[PSCustomObject]@{DexNumber = 15; Name = 'Beedrill'; DexEntry = "Flies at high speed and attacks using its large venomous stingers on its forelegs and tail."},
[PSCustomObject]@{DexNumber = 16; Name = 'Pidgey'; DexEntry = "A common sight in forests and woods. It flaps its wings at ground level to kick up blinding sand."},
[PSCustomObject]@{DexNumber = 17; Name = 'Pidgeotto'; DexEntry = "Very protective of its sprawling territorial area, this POKéMON will fiercely peck at any intruder."},
[PSCustomObject]@{DexNumber = 18; Name = 'Pidgeotto'; DexEntry = "When hunting, it skims the surface of water at high speed to pick off unwary prey such as MAGIKARP."},
[PSCustomObject]@{DexNumber = 19; Name = 'Rattata'; DexEntry = "Bites anything when it attacks. Small and very quick, it is a common sight in many places."},
[PSCustomObject]@{DexNumber = 20; Name = 'Ratciate'; DexEntry = "It uses its whiskers to maintain its balance. It apparently slows down if they are cut off."},
[PSCustomObject]@{DexNumber = 21; Name = 'Spearow'; DexEntry = "Eats bugs in grassy areas. It has to flap its short wings at high speed to stay airborne."},
[PSCustomObject]@{DexNumber = 22; Name = 'Fearow'; DexEntry = "With its huge and magnificent wings, it can keep aloft without ever having to land for rest."},
[PSCustomObject]@{DexNumber = 23; Name = 'Ekans'; DexEntry = "Moves silently and stealthily. Eats the eggs of birds, such as PIDGEY and SPEAROW, whole."},
[PSCustomObject]@{DexNumber = 24; Name = 'Arbok'; DexEntry = "It is rumored that the ferocious warning markings on its belly differ from area to area."},
[PSCustomObject]@{DexNumber = 25; Name = 'Pikachu'; DexEntry = "When several of these POKéMON gather, their electricity could build and cause lightning storms."},
[PSCustomObject]@{DexNumber = 26; Name = 'Raichu'; DexEntry = "Its long tail serves as a ground to protect itself from its own high voltage power."},
[PSCustomObject]@{DexNumber = 27; Name = 'Sandshrew'; DexEntry = "Burrows deep underground in arid locations far from water. It only emerges to hunt for food."},
[PSCustomObject]@{DexNumber = 28; Name = 'Sandslash'; DexEntry = "Curls up into a spiny ball when threatened. It can roll while curled up to attack or escape."},
[PSCustomObject]@{DexNumber = 29; Name = 'Nidoranf'; DexEntry = "Although small, its venomous barbs render this POKéMON dangerous. The female has smaller horns."},
[PSCustomObject]@{DexNumber = 30; Name = 'Nidorina'; DexEntry = "The female’s horn develops slowly. Prefers physical attacks such as clawing and biting."},
[PSCustomObject]@{DexNumber = 31; Name = 'Nidoqueen'; DexEntry = "Its hard scales provide strong protection. It uses its hefty bulk to execute powerful moves."},
[PSCustomObject]@{DexNumber = 32; Name = 'Nidoranm'; DexEntry = "Stiffens its ears to sense danger. The larger its horns, the more powerful its secreted venom."},
[PSCustomObject]@{DexNumber = 33; Name = 'Nidorino'; DexEntry = "An aggressive POKéMON that is quick to attack. The horn on its head secretes a powerful venom."},
[PSCustomObject]@{DexNumber = 34; Name = 'Nidoking'; DexEntry = "It uses its powerful tail in battle to smash, constrict, then break the prey’s bones."},
[PSCustomObject]@{DexNumber = 35; Name = 'Clefairy'; DexEntry = "Its magical and cute appeal has many admirers. It is rare and found only in certain areas."},
[PSCustomObject]@{DexNumber = 36; Name = 'Clefable'; DexEntry = "A timid fairy POKéMON that is rarely seen. It will run and hide the moment it senses people."},
[PSCustomObject]@{DexNumber = 37; Name = 'Vulpix'; DexEntry = "At the time of birth, it has just one tail. The tail splits from its tip as it grows older."},
[PSCustomObject]@{DexNumber = 38; Name = 'Ninetales'; DexEntry = "Very smart and very vengeful. Grabbing one of its many tails could result in a one-thousand year curse."},
[PSCustomObject]@{DexNumber = 39; Name = 'Jigglypuff'; DexEntry = "When its huge eyes light up, it sings a mysteriously soothing melody that lulls its enemies to sleep."},
[PSCustomObject]@{DexNumber = 40; Name = 'Wigglytuff'; DexEntry = "The body is soft and rubbery. When angered, it will suck in air and inflate itself to an enormous size."},
[PSCustomObject]@{DexNumber = 41; Name = 'Zubat'; DexEntry = "Forms colonies in perpetually dark places. Uses ultrasonic waves to identify and approach targets."},
[PSCustomObject]@{DexNumber = 42; Name = 'Golbat'; DexEntry = "Once it strikes, it will not stop draining energy from the victim even if it gets too heavy to fly."},
[PSCustomObject]@{DexNumber = 43; Name = 'Oddish'; DexEntry = "During the day, it keeps its face buried in the ground. At night, it wanders around sowing its seeds."},
[PSCustomObject]@{DexNumber = 44; Name = 'Gloom'; DexEntry = "The fluid that oozes from its mouth isn’t drool. It is a nectar that is used to attract prey."},
[PSCustomObject]@{DexNumber = 45; Name = 'Vileplume'; DexEntry = "The larger its petals, the more toxic pollen it contains. Its big head is heavy and hard to hold up."},
[PSCustomObject]@{DexNumber = 46; Name = 'Paras'; DexEntry = "Burrows to suck tree roots. The mushrooms on its back grow by drawing nutrients from the bug host."},
[PSCustomObject]@{DexNumber = 47; Name = 'Parasect'; DexEntry = "A host-parasite pair in which the parasite mushroom has taken over the host bug. Prefers damp places."},
[PSCustomObject]@{DexNumber = 48; Name = 'Venonat'; DexEntry = "Lives in the shadows of tall trees where it eats insects. It is attracted by light at night."},
[PSCustomObject]@{DexNumber = 49; Name = 'Venomoth'; DexEntry = "The dust-like scales covering its wings are color coded to indicate the kinds of poison it has."},
[PSCustomObject]@{DexNumber = 50; Name = 'Diglett'; DexEntry = "Lives about one yard underground where it feeds on plant roots. It sometimes appears above ground."},
[PSCustomObject]@{DexNumber = 51; Name = 'Dugtrio'; DexEntry = "A team of DIGLETT triplets. It triggers huge earthquakes by burrowing sixty miles underground."},
[PSCustomObject]@{DexNumber = 52; Name = 'Meowth'; DexEntry = "Adores circular objects. Wanders the streets on a nightly basis to look for dropped loose change."},
[PSCustomObject]@{DexNumber = 53; Name = 'Persian'; DexEntry = "Although its fur has many admirers, it is tough to raise as a pet because of its fickle meanness."},
[PSCustomObject]@{DexNumber = 54; Name = 'Psyduck'; DexEntry = "While lulling its enemies with its vacant look, this wily POKéMON will use psychokinetic powers."},
[PSCustomObject]@{DexNumber = 55; Name = 'Golduck'; DexEntry = "Often seen swimming elegantly by lake shores. It is often mistaken for the Japanese monster, Kappa."},
[PSCustomObject]@{DexNumber = 56; Name = 'Mankey'; DexEntry = "Extremely quick to anger. It could be docile one moment then thrashing away the next instant."},
[PSCustomObject]@{DexNumber = 57; Name = 'Primeape'; DexEntry = "Always furious and tenacious to boot. It will not abandon chasing its quarry until it is caught."},
[PSCustomObject]@{DexNumber = 58; Name = 'Growlithe'; DexEntry = "Very protective of its territory. It will bark and bite to repel intruders from its space."},
[PSCustomObject]@{DexNumber = 59; Name = 'Arcanine'; DexEntry = "A POKéMON that has been admired since the past for its beauty. It runs agilely as if on wings."},
[PSCustomObject]@{DexNumber = 60; Name = 'Poliwag'; DexEntry = "Its newly grown legs prevent it from running. It appears to prefer swimming than trying to stand."},
[PSCustomObject]@{DexNumber = 61; Name = 'Poliwhirl'; DexEntry = "Capable of living in or out of water. When out of water, it sweats to keep its body slimy."},
[PSCustomObject]@{DexNumber = 62; Name = 'Poliwrath'; DexEntry = "An adept swimmer at both the front crawl and breast stroke. Easily overtakes the best human swimmers."},
[PSCustomObject]@{DexNumber = 63; Name = 'Abra'; DexEntry = "Using its ability to read minds, it will identify impending danger and TELEPORT to safety."},
[PSCustomObject]@{DexNumber = 64; Name = 'Kadabra'; DexEntry = "It emits special alpha waves from its body that induce headaches just by being close by."},
[PSCustomObject]@{DexNumber = 65; Name = 'Alakazam'; DexEntry = "Its brain can outperform a supercomputer. Its intelligence quotient is said to be 5,000."},
[PSCustomObject]@{DexNumber = 66; Name = 'Machop'; DexEntry = "Loves to build its muscles. It trains in all styles of martial arts to become even stronger."},
[PSCustomObject]@{DexNumber = 67; Name = 'Machoke'; DexEntry = "Its muscular body is so powerful, it must wear a power save belt to be able to regulate its motions."},
[PSCustomObject]@{DexNumber = 68; Name = 'Machamp'; DexEntry = "Using its heavy muscles, it throws powerful punches that can send the victim clear over the horizon."},
[PSCustomObject]@{DexNumber = 69; Name = 'Bellsprout'; DexEntry = "A carnivorous POKéMON that traps and eats bugs. It uses its root feet to soak up needed moisture."},
[PSCustomObject]@{DexNumber = 70; Name = 'Weepinbell'; DexEntry = "It spits out POISONPOWDER to immobilize the enemy and then finishes it with a spray of ACID."},
[PSCustomObject]@{DexNumber = 71; Name = 'Victreebel'; DexEntry = "Said to live in huge colonies deep in jungles, although no one has ever returned from there."},
[PSCustomObject]@{DexNumber = 72; Name = 'Tentacool'; DexEntry = "Drifts in shallow seas. Anglers who hook them by accident are often punished by its stinging acid."},
[PSCustomObject]@{DexNumber = 73; Name = 'Tentacruel'; DexEntry = "The tentacles are normally kept short. On hunts, they are extended to ensnare and immobilize prey."},
[PSCustomObject]@{DexNumber = 74; Name = 'Geodude'; DexEntry = "Found in fields and mountains. Mistaking them for boulders, people often step or trip on them."},
[PSCustomObject]@{DexNumber = 75; Name = 'Graveler'; DexEntry = "Rolls down slopes to move. It rolls over any obstacle without slowing or changing its direction."},
[PSCustomObject]@{DexNumber = 76; Name = 'Golem'; DexEntry = "Its boulder-like body is extremely hard. It can easily withstand dynamite blasts without damage."},
[PSCustomObject]@{DexNumber = 77; Name = 'Ponyta'; DexEntry = "Its hooves are ten times harder than diamonds. It can trample anything completely flat in little time."},
[PSCustomObject]@{DexNumber = 78; Name = 'Rapidash'; DexEntry = "Very competitive, this POKéMON will chase anything that moves fast in the hopes of racing it."},
[PSCustomObject]@{DexNumber = 79; Name = 'Slowpoke'; DexEntry = "Incredibly slow and dopey. It takes 5 seconds for it to feel pain when under attack."},
[PSCustomObject]@{DexNumber = 80; Name = 'Slowbro'; DexEntry = "The SHELLDER that is latched onto SLOWPOKE’s tail is said to feed on the host’s left over scraps."},
[PSCustomObject]@{DexNumber = 81; Name = 'Magnemite'; DexEntry = "Uses anti-gravity to stay suspended. Appears without warning and uses THUNDER WAVE and similar moves."},
[PSCustomObject]@{DexNumber = 82; Name = 'Magneton'; DexEntry = "Formed by several MAGNEMITEs linked together. They frequently appear when sunspots flare up."},
[PSCustomObject]@{DexNumber = 83; Name = 'Farfetchd'; DexEntry = "The sprig of green onions it holds is its weapon. It is used much like a metal sword."},
[PSCustomObject]@{DexNumber = 84; Name = 'Doduo'; DexEntry = "A bird that makes up for its poor flying with its fast foot speed. Leaves giant footprints."},
[PSCustomObject]@{DexNumber = 85; Name = 'Dodrio'; DexEntry = "Uses its three brains to execute complex plans. While two heads sleep, one head stays awake."},
[PSCustomObject]@{DexNumber = 86; Name = 'Seel'; DexEntry = "The protruding horn on its head is very hard. It is used for bashing through thick ice."},
[PSCustomObject]@{DexNumber = 87; Name = 'Dewgong'; DexEntry = "Stores thermal energy in its body. Swims at a steady 8 knots even in intensely cold waters."},
[PSCustomObject]@{DexNumber = 88; Name = 'Grimer'; DexEntry = "Appears in filthy areas. Thrives by sucking up polluted sludge that is pumped out of factories."},
[PSCustomObject]@{DexNumber = 89; Name = 'Muk'; DexEntry = "Thickly covered with a filthy, vile sludge. It is so toxic, even its footprints contain poison."},
[PSCustomObject]@{DexNumber = 90; Name = 'Shellder'; DexEntry = "Its hard shell repels any kind of attack. It is vulnerable only when its shell is open."},
[PSCustomObject]@{DexNumber = 91; Name = 'Cloyster'; DexEntry = "When attacked, it launches its horns in quick volleys. Its innards have never been seen."},
[PSCustomObject]@{DexNumber = 92; Name = 'Gastly'; DexEntry = "Almost invisible, this gaseous POKéMON cloaks the target and puts it to sleep without notice."},
[PSCustomObject]@{DexNumber = 93; Name = 'Haunter'; DexEntry = "Because of its ability to slip through block walls, it is said to be from another dimension."},
[PSCustomObject]@{DexNumber = 94; Name = 'Gengar'; DexEntry = "Under a full moon, this POKéMON likes to mimic the shadows of people and laugh at their fright."},
[PSCustomObject]@{DexNumber = 95; Name = 'Onix'; DexEntry = "As it grows, the stone portions of its body harden to become similar to a diamond, but colored black."},
[PSCustomObject]@{DexNumber = 96; Name = 'Drowzee'; DexEntry = "Puts enemies to sleep then eats their dreams. Occasionally gets sick from eating bad dreams."},
[PSCustomObject]@{DexNumber = 97; Name = 'Hypno'; DexEntry = "When it locks eyes with an enemy, it will use a mix of PSI moves such as HYPNOSIS and CONFUSION."},
[PSCustomObject]@{DexNumber = 98; Name = 'Krabby'; DexEntry = "Its pincers are not only powerful weapons, they are used for balance when walking sideways."},
[PSCustomObject]@{DexNumber = 99; Name = 'Kingler'; DexEntry = "The large pincer has tenthousand hp of crushing power. However, its huge size makes it unwieldy to use."},
[PSCustomObject]@{DexNumber = 100; Name = 'Voltorb'; DexEntry = "Usually found in power plants. Easily mistaken for a POKé BALL, they have zapped many people."},
[PSCustomObject]@{DexNumber = 101; Name = 'Electrode'; DexEntry = "It stores electric energy under very high pressure. It often explodes with little or no provocation."},
[PSCustomObject]@{DexNumber = 102; Name = 'Exeggcute'; DexEntry = "Often mistaken for eggs. When disturbed, they quickly gather and attack in swarms."},
[PSCustomObject]@{DexNumber = 103; Name = 'Exeggutor'; DexEntry = "Legend has it that on rare occasions, one of its heads will drop off and continue on as an EXEGGCUTE."},
[PSCustomObject]@{DexNumber = 104; Name = 'Cubone'; DexEntry = "Because it never removes its skull helmet, no one has ever seen this POKéMON’s real face."},
[PSCustomObject]@{DexNumber = 105; Name = 'Marowak'; DexEntry = "The bone it holds is its key weapon. It throws the bone skillfully like a boomerang to KO targets."},
[PSCustomObject]@{DexNumber = 106; Name = 'Hitmonlee'; DexEntry = "When in a hurry, its legs lengthen progressively. It runs smoothly with extra long, loping strides."},
[PSCustomObject]@{DexNumber = 107; Name = 'Hitmonchan'; DexEntry = "While apparently doing nothing, it fires punches in lightning fast volleys that are impossible to see."},
[PSCustomObject]@{DexNumber = 108; Name = 'Lickitung'; DexEntry = "Its tongue can be extended like a chameleon’s. It leaves a tingling sensation when it licks enemies."},
[PSCustomObject]@{DexNumber = 109; Name = 'Koffing'; DexEntry = "Because it stores several kinds of toxic gases in its body, it is prone to exploding without warning."},
[PSCustomObject]@{DexNumber = 110; Name = 'Weezing'; DexEntry = "Where two kinds of poison gases meet, two KOFFINGs can fuse into a WEEZING over many years."},
[PSCustomObject]@{DexNumber = 111; Name = 'Rhyhorn'; DexEntry = "Its massive bones are onethousand times harder than human bones. It can easily knock a trailer flying."},
[PSCustomObject]@{DexNumber = 112; Name = 'Rhydon'; DexEntry = "Protected by an armor-like hide, it is capable of living in molten lava of threethousandsixhundred degrees."},
[PSCustomObject]@{DexNumber = 113; Name = 'Chansey'; DexEntry = "A rare and elusive POKéMON that is said to bring happiness to those who manage to get it."},
[PSCustomObject]@{DexNumber = 114; Name = 'Tangela'; DexEntry = "The whole body is swathed with wide vines that are similar to seaweed. Its vines shake as it walks."},
[PSCustomObject]@{DexNumber = 115; Name = 'Kangaskhan'; DexEntry = "The infant rarely ventures out of its mother’s protective pouch until it is three years old."},
[PSCustomObject]@{DexNumber = 116; Name = 'Horsea'; DexEntry = "Known to shoot down flying bugs with precision blasts of ink from the surface of the water."},
[PSCustomObject]@{DexNumber = 117; Name = 'Seadra'; DexEntry = "Known to shoot down flying bugs with precision blasts of ink from the surface of the water."},
[PSCustomObject]@{DexNumber = 118; Name = 'Goldeen'; DexEntry = "Its tail fin billows like an elegant ballroom dress, giving it the nickname of the Water Queen."},
[PSCustomObject]@{DexNumber = 119; Name = 'Seaking'; DexEntry = "In the autumn spawning season, they can be seen swimming powerfully up rivers and creeks."},
[PSCustomObject]@{DexNumber = 120; Name = 'Staryu'; DexEntry = "An enigmatic POKéMON that can effortlessly regenerate any appendage it loses in battle."},
[PSCustomObject]@{DexNumber = 121; Name = 'Starmie'; DexEntry = "Its central core glows with the seven colors of the rainbow. Some people value the core as a gem."},
[PSCustomObject]@{DexNumber = 122; Name = 'Mr Mime'; DexEntry = "If interrupted while it is miming, it will slap around the offender with its broad hands."},
[PSCustomObject]@{DexNumber = 123; Name = 'Scyther'; DexEntry = "With ninja-like agility and speed, it can create the illusion that there is more than one."},
[PSCustomObject]@{DexNumber = 124; Name = 'Jynx'; DexEntry = "It seductively wiggles its hips as it walks. It can cause people to dance in unison with it."},
[PSCustomObject]@{DexNumber = 125; Name = 'Electabuzz'; DexEntry = "Normally found near power plants, they can wander away and cause major blackouts in cities."},
[PSCustomObject]@{DexNumber = 126; Name = 'Magmar'; DexEntry = "Its body always burns with an orange glow that enables it to hide perfectly among flames."},
[PSCustomObject]@{DexNumber = 127; Name = 'Pinsir'; DexEntry = "If it fails to crush the victim in its pincers, it will swing it around and toss it hard."},
[PSCustomObject]@{DexNumber = 128; Name = 'Tauros'; DexEntry = "When it targets an enemy, it charges furiously while whipping its body with its long tails."},
[PSCustomObject]@{DexNumber = 129; Name = 'Magikarp'; DexEntry = "In the distant past, it was somewhat stronger than the horribly weak descendants that exist today."},
[PSCustomObject]@{DexNumber = 130; Name = 'Gyrados'; DexEntry = "Rarely seen in the wild. Huge and vicious, it is capable of destroying entire cities in a rage."},
[PSCustomObject]@{DexNumber = 131; Name = 'Lapras'; DexEntry = "A POKéMON that has been overhunted almost to extinction. It can ferry people across the water."},
[PSCustomObject]@{DexNumber = 132; Name = 'Ditto'; DexEntry = "A POKéMON that has been overhunted almost to extinction. It can ferry people across the water."},
[PSCustomObject]@{DexNumber = 133; Name = 'Eevee'; DexEntry = "Its genetic code is irregular. It may mutate if it is exposed to radiation from element STONEs."},
[PSCustomObject]@{DexNumber = 134; Name = 'Vaporeon'; DexEntry = "Lives close to water. Its long tail is ridged with a fin which is often mistaken for a mermaid’s."},
[PSCustomObject]@{DexNumber = 135; Name = 'Jolteon'; DexEntry = "It accumulates negative ions in the atmosphere to blast out tenthousandvolt lightning bolts."},
[PSCustomObject]@{DexNumber = 136; Name = 'Flareon'; DexEntry = "When storing thermal energy in its body, its temperature could soar to over onethousandsixhundred degrees."},
[PSCustomObject]@{DexNumber = 137; Name = 'Porygon'; DexEntry = "A POKéMON that consists entirely of programming code. Capable of moving freely in cyberspace."},
[PSCustomObject]@{DexNumber = 138; Name = 'Omanyte'; DexEntry = "Although long extinct, in rare cases, it can be genetically resurrected from fossils."},
[PSCustomObject]@{DexNumber = 139; Name = 'Omastar'; DexEntry = "A prehistoric POKéMON that died out when its heavy shell made it impossible to catch prey."},
[PSCustomObject]@{DexNumber = 140; Name = 'Kabuto'; DexEntry = "A POKéMON that was resurrected from a fossil found in what was once the ocean floor eons ago."},
[PSCustomObject]@{DexNumber = 141; Name = 'Kabutops'; DexEntry = "A POKéMON that was resurrected from a fossil found in what was once the ocean floor eons ago."},
[PSCustomObject]@{DexNumber = 142; Name = 'Aerodactyl'; DexEntry = "A ferocious, prehistoric POKéMON that goes for the enemy’s throat with its serrated saw-like fangs."},
[PSCustomObject]@{DexNumber = 143; Name = 'Snorlax'; DexEntry = "Very lazy. Just eats and sleeps. As its rotund bulk builds, it becomes steadily more slothful."},
[PSCustomObject]@{DexNumber = 144; Name = 'Articuno'; DexEntry = "A legendary bird POKéMON that is said to appear to doomed people who are lost in icy mountains."},
[PSCustomObject]@{DexNumber = 145; Name = 'Zapdos'; DexEntry = "A legendary bird POKéMON that is said to appear from clouds while dropping enormous lightning bolts."},
[PSCustomObject]@{DexNumber = 146; Name = 'Moltres'; DexEntry = "Known as the legendary bird of fire. Every flap of its wings creates a dazzling flash of flames."},
[PSCustomObject]@{DexNumber = 147; Name = 'Dratini'; DexEntry = "Long considered a mythical POKéMON until recently when a small colony was found living underwater."},
[PSCustomObject]@{DexNumber = 148; Name = 'Dragonair'; DexEntry = "A mystical POKéMON that exudes a gentle aura. Has the ability to change climate conditions."},
[PSCustomObject]@{DexNumber = 149; Name = 'Dragonite'; DexEntry = "An extremely rarely seen marine POKéMON. Its intelligence is said to match that of humans."},
[PSCustomObject]@{DexNumber = 150; Name = 'Mewtwo'; DexEntry = "It was created by a scientist after years of horrific gene splicing and DNA engineering experiments."},
[PSCustomObject]@{DexNumber = 151; Name = 'Mew'; DexEntry = "So rare that it is still said to be a mirage by many experts. Only a few people have seen it worldwide."}
)

function Get-Pokemon {
    param (
        [parameter(Mandatory=$true)]
        [string]$identifer
    )

    $result = $PokedexData | Where-Object { $_.DexNumber -eq $identifer -or
              $PokedexData | Where-Object  $_.Name -eq $Identifier}
    
            return $result
}

function Assemble-DexEntries {
    param (
        [string[]]$team
        )

        $entries = @()
        foreach ($identifier in $team) {
            $pokemon = Get-Pokemon -identifer $identifier
            if ($Pokemon) {
                $entries += $Pokemon.DexEntry
            }
        }
        return $entries
    
}

function new-PoKey {
    param(
        [string[]]$PokemonTeam
    )

    # Error checking to ensure the array length is correct, and that all items in the array are Pokemon numbers
    if ($PokemonTeam.length -lt 1) {
        Write-Host "ERROR: Requires at least one Pokemon on the team"
        return
    } elseif ($PokemonTeam.length -gt 6) {
        Write-Host "ERROR: You can only have six Pokemon in the array"
        return
    }

    $TeamLength = $PokemonTeam.Length

    # Assemble the Dex Entries

    $entires = Assemble-DexEntries -PokemonList $PokemonTeam

    # Determine the maximum entry length
    function determineMaxEntryLength {
        param (
            [string[]]$entries
        )
        $maxLength = 0
        foreach ($e in $entries) {
            if ($e.Length -gt $maxLength) {
                $maxLength = $e.Length
            }
        }
        return $maxLength
    }

    # Assemble the key
    function keyAssemble {
        param (
            [string[]]$entries,
            [int]$maxLength,
            [int]$teamLength
        )
        $key = ''
        for ($i = 0; $i -lt $maxLength; $i++) {
            $n = 0
            while ($n -lt $teamLength) {
                if ($i -lt $entries[$n].Length) {
                    $string = $entries[$n]
                    $key += $string[$i]
                }
                $n += 1
            }
        }
        return $key
    }

    $maxLength = determineMaxEntryLength -team $PokemonTeam
    $entriesArray = Assemble-DexEntries -team $PokemonTeam
    $CombinedEntriesString = keyAssemble -entries $entriesArray -maxLength $maxLength -teamLength $TeamLength

    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    $byteArray = [System.Text.Encoding]::UTF8.GetBytes($CombinedEntriesString)
    $hashBytes = $sha256.ComputeHash($byteArray)

    $hexString = -join ($hashBytes | ForEach-Object { "{0:X2}" -f $_ })
    
    return $hexString
}

#other functions to add: Encrypt string with Vigenere cipher, decrypt with Vigenere cipher.