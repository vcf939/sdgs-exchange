import {readFileSync,mkdirSync,writeFileSync} from 'node:fs';
import {dirname} from 'node:path';
const source=JSON.parse(readFileSync(new URL('./site-source.json',import.meta.url),'utf8'));
for(const [path,content] of Object.entries(source)){
 if(!/^(public|functions|lib)\//.test(path)||path.split('/').includes('..')||typeof content!=='string')throw Error('Invalid source path');
 mkdirSync(dirname(path),{recursive:true});writeFileSync(path,content);
}
console.log('Built SDGs Exchange: '+Object.keys(source).length+' files');
