// キャラクターモデル
// ポケモンはPokeAPIのスプライト画像URLを使用（個人利用のみ）

enum CharacterType { pokemon, animalCrossing }

class Character {
  final String id;
  final String name; // ひらがな表記
  final String displayName; // カタカナ表記（図鑑用）
  final CharacterType type;
  final String? spriteUrl; // ポケモンスプライトURL
  final String? emoji; // どうぶつの森キャラ用
  final String unlockHint; // どのゲームでアンロックするか

  const Character({
    required this.id,
    required this.name,
    required this.displayName,
    required this.type,
    this.spriteUrl,
    this.emoji,
    required this.unlockHint,
  });
}

// ポケモンスプライトURL（PokeAPI公式リポジトリ）
String pokeSprite(int id) =>
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

const List<Character> allCharacters = [
  // ===== ポケモン 1〜100 =====
  // 奇数番目 → かたかなゲーム / 偶数番目 → とけいゲーム
  Character(id: 'bulbasaur',   name: 'ふしぎだね',  displayName: 'フシギダネ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',   unlockHint: 'かたかなゲーム'),
  Character(id: 'ivysaur',     name: 'ふしぎそう',  displayName: 'フシギソウ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png',   unlockHint: 'とけいゲーム'),
  Character(id: 'venusaur',    name: 'ふしぎばな',  displayName: 'フシギバナ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png',   unlockHint: 'かたかなゲーム'),
  Character(id: 'charmander',  name: 'ひとかげ',    displayName: 'ヒトカゲ',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',   unlockHint: 'とけいゲーム'),
  Character(id: 'charmeleon',  name: 'りざーど',    displayName: 'リザード',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',   unlockHint: 'かたかなゲーム'),
  Character(id: 'charizard',   name: 'りざーどん',  displayName: 'リザードン',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',   unlockHint: 'とけいゲーム'),
  Character(id: 'squirtle',    name: 'ぜにがめ',    displayName: 'ゼニガメ',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',   unlockHint: 'かたかなゲーム'),
  Character(id: 'wartortle',   name: 'かめーる',    displayName: 'カメール',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png',   unlockHint: 'とけいゲーム'),
  Character(id: 'blastoise',   name: 'かめっくす',  displayName: 'カメックス',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png',   unlockHint: 'かたかなゲーム'),
  Character(id: 'caterpie',    name: 'きゃたぴー',  displayName: 'キャタピー',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'metapod',     name: 'とらんせる',  displayName: 'トランセル',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/11.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'butterfree',  name: 'ばたふりー',  displayName: 'バタフリー',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/12.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'weedle',      name: 'びーどる',    displayName: 'ビードル',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/13.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'kakuna',      name: 'こくーん',    displayName: 'コクーン',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/14.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'beedrill',    name: 'すぴあ',      displayName: 'スピア',      type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/15.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'pidgey',      name: 'ぽっぽ',      displayName: 'ポッポ',      type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/16.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'pidgeotto',   name: 'ぴじょん',    displayName: 'ピジョン',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/17.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'pidgeot',     name: 'ぴじょっと',  displayName: 'ピジョット',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/18.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'rattata',     name: 'こらった',    displayName: 'コラッタ',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/19.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'raticate',    name: 'らった',      displayName: 'ラッタ',      type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/20.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'spearow',     name: 'おにすずめ',  displayName: 'オニスズメ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/21.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'fearow',      name: 'おにどりる',  displayName: 'オニドリル',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/22.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'ekans',       name: 'あーぼ',      displayName: 'アーボ',      type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/23.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'arbok',       name: 'あーぼっく',  displayName: 'アーボック',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/24.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'pikachu',     name: 'ぴかちゅう',  displayName: 'ピカチュウ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'raichu',      name: 'らいちゅう',  displayName: 'ライチュウ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/26.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'sandshrew',   name: 'さんど',      displayName: 'サンド',      type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/27.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'sandslash',   name: 'さんどぱん',  displayName: 'サンドパン',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/28.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'nidoran-f',   name: 'にどらん',    displayName: 'ニドラン♀',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/29.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'nidorina',    name: 'にどりーな',  displayName: 'ニドリーナ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/30.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'nidoqueen',   name: 'にどくいん',  displayName: 'ニドクイン',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/31.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'nidoran-m',   name: 'にどらんおす', displayName: 'ニドラン♂', type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/32.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'nidorino',    name: 'にどりーの',  displayName: 'ニドリーノ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/33.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'nidoking',    name: 'にどきんぐ',  displayName: 'ニドキング',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/34.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'clefairy',    name: 'ぴっぴ',      displayName: 'ピッピ',      type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/35.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'clefable',    name: 'ぴくしー',    displayName: 'ピクシー',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/36.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'vulpix',      name: 'ろこん',      displayName: 'ロコン',      type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/37.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'ninetales',   name: 'きゅうこん',  displayName: 'キュウコン',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/38.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'jigglypuff',  name: 'ぷりん',      displayName: 'プリン',      type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/39.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'wigglytuff',  name: 'ぷくりん',    displayName: 'プクリン',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/40.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'zubat',       name: 'ずばっと',    displayName: 'ズバット',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/41.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'golbat',      name: 'ごるばっと',  displayName: 'ゴルバット',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/42.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'oddish',      name: 'なぞのくさ',  displayName: 'ナゾノクサ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/43.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'gloom',       name: 'くさいはな',  displayName: 'クサイハナ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/44.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'vileplume',   name: 'らふれしあ',  displayName: 'ラフレシア',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/45.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'paras',       name: 'ぱらす',      displayName: 'パラス',      type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/46.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'parasect',    name: 'ぱらせくと',  displayName: 'パラセクト',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/47.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'venonat',     name: 'こんぱん',    displayName: 'コンパン',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/48.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'venomoth',    name: 'もるふぉん',  displayName: 'モルフォン',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/49.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'diglett',     name: 'でぃぐだ',    displayName: 'ディグダ',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/50.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'dugtrio',     name: 'だぐとりお',  displayName: 'ダグトリオ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/51.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'meowth',      name: 'にゃーす',    displayName: 'ニャース',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/52.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'persian',     name: 'ぺるしあん',  displayName: 'ペルシアン',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/53.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'psyduck',     name: 'こだっく',    displayName: 'コダック',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/54.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'golduck',     name: 'ごるだっく',  displayName: 'ゴルダック',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/55.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'mankey',      name: 'まんきー',    displayName: 'マンキー',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/56.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'primeape',    name: 'おこりざる',  displayName: 'オコリザル',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/57.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'growlithe',   name: 'がーでぃ',    displayName: 'ガーディ',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/58.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'arcanine',    name: 'ういんでぃ',  displayName: 'ウインディ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/59.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'poliwag',     name: 'にょろも',    displayName: 'ニョロモ',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/60.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'poliwhirl',   name: 'にょろぞ',    displayName: 'ニョロゾ',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/61.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'poliwrath',   name: 'にょろぼん',  displayName: 'ニョロボン',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/62.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'abra',        name: 'けーしぃ',    displayName: 'ケーシィ',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/63.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'kadabra',     name: 'ゆんげらー',  displayName: 'ユンゲラー',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/64.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'alakazam',    name: 'ふーでぃん',  displayName: 'フーディン',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/65.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'machop',      name: 'わんりきー',  displayName: 'ワンリキー',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/66.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'machoke',     name: 'ごーりきー',  displayName: 'ゴーリキー',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/67.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'machamp',     name: 'かいりきー',  displayName: 'カイリキー',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/68.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'bellsprout',  name: 'まだつぼみ',  displayName: 'マダツボミ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/69.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'weepinbell',  name: 'うつどん',    displayName: 'ウツドン',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/70.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'victreebel',  name: 'うつぼっと',  displayName: 'ウツボット',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/71.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'tentacool',   name: 'めのくらげ',  displayName: 'メノクラゲ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/72.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'tentacruel',  name: 'どくくらげ',  displayName: 'ドククラゲ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/73.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'geodude',     name: 'いしつぶて',  displayName: 'イシツブテ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/74.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'graveler',    name: 'ごろーん',    displayName: 'ゴローン',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/75.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'golem',       name: 'ごろーにゃ',  displayName: 'ゴローニャ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/76.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'ponyta',      name: 'ぽにーた',    displayName: 'ポニータ',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/77.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'rapidash',    name: 'ぎゃろっぷ',  displayName: 'ギャロップ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/78.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'slowpoke',    name: 'やどん',      displayName: 'ヤドン',      type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/79.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'slowbro',     name: 'やどらん',    displayName: 'ヤドラン',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/80.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'magnemite',   name: 'こいる',      displayName: 'コイル',      type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/81.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'magneton',    name: 'れあこいる',  displayName: 'レアコイル',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/82.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'farfetchd',   name: 'かもねぎ',    displayName: 'カモネギ',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/83.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'doduo',       name: 'どーどー',    displayName: 'ドードー',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/84.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'dodrio',      name: 'どーどりお',  displayName: 'ドードリオ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/85.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'seel',        name: 'ぱうわう',    displayName: 'パウワウ',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/86.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'dewgong',     name: 'じゅごん',    displayName: 'ジュゴン',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/87.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'grimer',      name: 'べとべたー',  displayName: 'ベトベター',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/88.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'muk',         name: 'べとべとん',  displayName: 'ベトベトン',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/89.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'shellder',    name: 'しぇるだー',  displayName: 'シェルダー',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/90.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'cloyster',    name: 'ぱるしぇん',  displayName: 'パルシェン',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/91.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'gastly',      name: 'ごーす',      displayName: 'ゴース',      type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/92.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'haunter',     name: 'ごーすと',    displayName: 'ゴースト',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/93.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'gengar',      name: 'げんがー',    displayName: 'ゲンガー',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/94.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'onix',        name: 'いわーく',    displayName: 'イワーク',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/95.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'drowzee',     name: 'すりーぷ',    displayName: 'スリープ',    type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/96.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'hypno',       name: 'すりーぱー',  displayName: 'スリーパー',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/97.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'krabby',      name: 'くらぶ',      displayName: 'クラブ',      type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/98.png',  unlockHint: 'とけいゲーム'),
  Character(id: 'kingler',     name: 'きんぐらー',  displayName: 'キングラー',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/99.png',  unlockHint: 'かたかなゲーム'),
  Character(id: 'voltorb',     name: 'びりりだま',  displayName: 'ビリリダマ',  type: CharacterType.pokemon, spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/100.png', unlockHint: 'とけいゲーム'),

  // ===== どうぶつの森 =====
  Character(id: 'tanukichi', name: 'たぬきち', displayName: 'タヌキチ', type: CharacterType.animalCrossing, emoji: '🦝', unlockHint: 'かたかなゲーム'),
  Character(id: 'shizue',    name: 'しずえ',   displayName: 'シズエ',   type: CharacterType.animalCrossing, emoji: '🐾', unlockHint: 'とけいゲーム'),
  Character(id: 'bouquet',   name: 'ぶーけ',   displayName: 'ブーケ',   type: CharacterType.animalCrossing, emoji: '🐰', unlockHint: 'かたかなゲーム'),
  Character(id: 'jun',       name: 'じゅん',   displayName: 'ジュン',   type: CharacterType.animalCrossing, emoji: '🐻', unlockHint: 'とけいゲーム'),
];
