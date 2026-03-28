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
  // --- ポケモン ---
  Character(
    id: 'pikachu',
    name: 'ぴかちゅう',
    displayName: 'ピカチュウ',
    type: CharacterType.pokemon,
    spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
    unlockHint: 'かたかなゲーム',
  ),
  Character(
    id: 'eevee',
    name: 'いーぶい',
    displayName: 'イーブイ',
    type: CharacterType.pokemon,
    spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/133.png',
    unlockHint: 'かたかなゲーム',
  ),
  Character(
    id: 'charmander',
    name: 'ひとかげ',
    displayName: 'ヒトカゲ',
    type: CharacterType.pokemon,
    spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
    unlockHint: 'とけいゲーム',
  ),
  Character(
    id: 'squirtle',
    name: 'ぜにがめ',
    displayName: 'ゼニガメ',
    type: CharacterType.pokemon,
    spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',
    unlockHint: 'とけいゲーム',
  ),
  Character(
    id: 'bulbasaur',
    name: 'ふしぎだね',
    displayName: 'フシギダネ',
    type: CharacterType.pokemon,
    spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
    unlockHint: 'かたかなゲーム',
  ),
  Character(
    id: 'jigglypuff',
    name: 'ぷりん',
    displayName: 'プリン',
    type: CharacterType.pokemon,
    spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/39.png',
    unlockHint: 'とけいゲーム',
  ),
  Character(
    id: 'psyduck',
    name: 'こだっく',
    displayName: 'コダック',
    type: CharacterType.pokemon,
    spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/54.png',
    unlockHint: 'かたかなゲーム',
  ),
  Character(
    id: 'togepi',
    name: 'とげぴー',
    displayName: 'トゲピー',
    type: CharacterType.pokemon,
    spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/175.png',
    unlockHint: 'とけいゲーム',
  ),
  // --- どうぶつの森 ---
  Character(
    id: 'tanukichi',
    name: 'たぬきち',
    displayName: 'タヌキチ',
    type: CharacterType.animalCrossing,
    emoji: '🦝',
    unlockHint: 'かたかなゲーム',
  ),
  Character(
    id: 'shizue',
    name: 'しずえ',
    displayName: 'シズエ',
    type: CharacterType.animalCrossing,
    emoji: '🐾',
    unlockHint: 'とけいゲーム',
  ),
  Character(
    id: 'bouquet',
    name: 'ぶーけ',
    displayName: 'ブーケ',
    type: CharacterType.animalCrossing,
    emoji: '🐰',
    unlockHint: 'かたかなゲーム',
  ),
  Character(
    id: 'jun',
    name: 'じゅん',
    displayName: 'ジュン',
    type: CharacterType.animalCrossing,
    emoji: '🐻',
    unlockHint: 'とけいゲーム',
  ),
];
