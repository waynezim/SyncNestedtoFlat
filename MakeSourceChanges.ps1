#Docker Container Naming Scheme - https://github.com/moby/moby/blob/master/pkg/namesgenerator/names-generator.go
$Left = @("admiring", "adoring", "affectionate", "agitated", "amazing", "angry", "awesome", "blissful", "bold", "boring", "brave", "charming", "clever", "cocky", "cool", "compassionate", "competent", "condescending", "confident", "cranky", "crazy", "dazzling", "determined", "distracted", "dreamy", "eager", "ecstatic", "elastic", "elated", "elegant", "eloquent", "epic", "fervent", "festive", "flamboyant", "focused", "friendly", "frosty", "gallant", "gifted", "goofy", "gracious", "happy", "hardcore", "heuristic", "hopeful", "hungry", "infallible", "inspiring", "jolly", "jovial", "keen", "kind", "laughing", "loving", "lucid", "magical", "mystifying", "modest", "musing", "naughty", "nervous", "nifty", "nostalgic", "objective", "optimistic", "peaceful", "pedantic", "pensive", "practical", "priceless", "quirky", "quizzical", "recursing", "relaxed", "reverent", "romantic", "sad", "serene", "sharp", "silly", "sleepy", "stoic", "stupefied", "suspicious", "sweet", "tender", "thirsty", "trusting", "unruffled", "upbeat", "vibrant", "vigilant", "vigorous", "wizardly", "wonderful", "xenodochial", "youthful", "zealous", "zen")
$Right = @("agnesi", "albattani", "allen", "almeida", "antonelli", "archimedes", "ardinghelli", "aryabhata", "austin", "babbage", "banach", "banzai", "bardeen", "bartik", "bassi", "beaver", "bell", "benz", "bhabha", "bhaskara", "black", "blackburn", "blackwell", "bohr", "booth", "borg", "bose", "boyd", "brahmagupta", "brattain", "brown", "buck", "burnell", "cannon", "carson", "cartwright", "cerf", "chandrasekhar", "chaplygin", "chatelet", "chatterjee", "chaum", "chebyshev", "clarke", "cohen", "colden", "cori", "cray", "curie", "curran", "darwin", "davinci", "dewdney", "dhawan", "diffie", "dijkstra", "dirac", "driscoll", "dubinsky", "easley", "edison", "einstein", "elbakyan", "elgamal", "elion", "ellis", "engelbart", "euclid", "euler", "faraday", "feistel", "fermat", "fermi", "feynman", "franklin", "gagarin", "galileo", "galois", "ganguly", "gates", "gauss", "germain", "goldberg", "goldstine", "goldwasser", "golick", "goodall", "gould", "greider", "grothendieck", "haibt", "hamilton", "haslett", "hawking", "heisenberg", "hellman", "hermann", "herschel", "hertz", "heyrovsky", "hodgkin", "hofstadter", "hoover", "hopper", "hugle", "hypatia", "ishizaka", "jackson", "jang", "jennings", "jepsen", "johnson", "joliot", "jones", "kalam", "kapitsa", "kare", "keldysh", "keller", "kepler", "khayyam", "khorana", "kilby", "kirch", "knuth", "kowalevski", "lalande", "lamarr", "lamport", "leakey", "leavitt", "lederberg", "lehmann", "lewin", "lichterman", "liskov", "lovelace", "lumiere", "mahavira", "margulis", "matsumoto", "maxwell", "mayer", "mccarthy", "mcclintock", "mclaren", "mclean", "mcnulty", "meitner", "mendel", "mendeleev", "meninsky", "merkle", "mestorf", "minsky", "mirzakhani", "montalcini", "moore", "morse", "moser", "murdock", "napier", "nash", "neumann", "newton", "nightingale", "nobel", "noether", "northcutt", "noyce", "panini", "pare", "pascal", "pasteur", "payne", "perlman", "pike", "poincare", "poitras", "proskuriakova", "ptolemy", "raman", "ramanujan", "rhodes", "ride", "ritchie", "robinson", "roentgen", "rosalind", "rubin", "saha", "sammet", "sanderson", "shamir", "shannon", "shaw", "shirley", "shockley", "shtern", "sinoussi", "snyder", "solomon", "spence", "stallman", "stonebraker", "sutherland", "swanson", "swartz", "swirles", "taussig", "tereshkova", "tesla", "tharp", "thompson", "torvalds", "tu", "turing", "varahamihira", "vaughan", "villani", "visvesvaraya", "volhard", "wescoff", "wilbur", "wiles", "williams", "williamson", "wilson", "wing", "wozniak", "wright", "wu", "yalow", "yonath", "zhukovsky")

#Set Paths
$SourceFolder = (Resolve-Path ".\SRCFolder").Path

#Get Source File Listing
$SourceFiles = Get-ChildItem -Path $SourceFolder -Recurse -File

$ModifyNumber = Get-Random -Minimum 0 -Maximum 50
$SourceFiles | Get-Random -Count $ModifyNumber | ForEach-Object {
    Add-Content -Path $_.FullName -Value (New-Guid).guid -Verbose
}

$DeleteNumber = Get-Random -Minimum 0 -Maximum 50
$SourceFiles | Get-Random -Count $DeleteNumber | ForEach-Object {
    Remove-Item -Path $_.FullName -Verbose
}

$NewNumber = Get-Random -Minimum 0 -Maximum 50
$SourceFiles | Get-Random -Count $NewNumber | ForEach-Object {
    $filename = (Get-Random -InputObject $Left) + "-" + (Get-Random -InputObject $Right) + "-" + (Get-Random) + ".txt"
    Set-Content -Value (New-Guid).guid -Path "$($_.Directory)\$filename" -Verbose
}