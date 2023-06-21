## Annomation of metagenomes on assembled reads
### Assemble reads with megahit
```
#bates dataset
#k list: 21,29,39,59,79,99,119,141
source activate megahit
cd /hpcstor6/scratch01/p/patrick.kearns/bates_metaG/Metagenomics_data_Bates_etal_2022
megahit -1 PNP16-303_R1_001.fastq.gz -2 PNP16-303_R2_001.fastq.gz --out-dir megahit_PNP16_303 --num-cpu-threads 64
megahit -1 PNP16-314_R1_001.fastq.gz -2 PNP16-314_R2_001.fastq.gz --out-dir megahit_PNP16_314 --num-cpu-threads 64
megahit -1 PNP16-321_R1_001.fastq.gz -2 PNP16-321_R2_001.fastq.gz --out-dir megahit_PNP16_321 --num-cpu-threads 64
megahit -1 PNP16-307_R1_001.fastq.gz -2 PNP16-307_R2_001.fastq.gz --out-dir megahit_PNP16_307 --num-cpu-threads 64
megahit -1 PNP16-316_R1_001.fastq.gz -2 PNP16-316_R2_001.fastq.gz --out-dir megahit_PNP16_316 --num-cpu-threads 64
megahit -1 PNP16-322_R1_001.fastq.gz -2 PNP16-322_R2_001.fastq.gz --out-dir megahit_PNP16_322 --num-cpu-threads 64
megahit -1 PNP16-308_R1_001.fastq.gz -2 PNP16-308_R2_001.fastq.gz --out-dir megahit_PNP16_308 --num-cpu-threads 64
megahit -1 PNP16-317_R1_001.fastq.gz -2 PNP16-317_R2_001.fastq.gz --out-dir megahit_PNP16_317 --num-cpu-threads 64
megahit -1 PNP16-323_R1_001.fastq.gz -2 PNP16-323_R2_001.fastq.gz --out-dir megahit_PNP16_323 --num-cpu-threads 64
megahit -1 PNP16-311_R1_001.fastq.gz -2 PNP16-311_R2_001.fastq.gz --out-dir megahit_PNP16_311 --num-cpu-threads 64
megahit -1 PNP16-319_R1_001.fastq.gz -2 PNP16-319_R2_001.fastq.gz --out-dir megahit_PNP16_319 --num-cpu-threads 64
megahit -1 PNP16-324_R1_001.fastq.gz -2 PNP16-324_R2_001.fastq.gz --out-dir megahit_PNP16_324 --num-cpu-threads 64
megahit -1 PNP16-312_R1_001.fastq.gz -2 PNP16-312_R2_001.fastq.gz --out-dir megahit_PNP16_312 --num-cpu-threads 64
megahit -1 PNP16-320_R1_001.fastq.gz -2 PNP16-320_R2_001.fastq.gz --out-dir megahit_PNP16_320 --num-cpu-threads 64
```
```
#joe's dataset
megahit -1 SRR19160141_1.fastq.gz -2 SRR19160141_2.fastq.gz --out-dir megahit_SRR19160141 --num-cpu-threads 64
megahit -1 SRR19160142_1.fastq.gz -2 SRR19160142_2.fastq.gz --out-dir megahit_SRR19160142 --num-cpu-threads 64
megahit -1 SRR19160143_1.fastq.gz -2 SRR19160143_2.fastq.gz --out-dir megahit_SRR19160143 --num-cpu-threads 64
megahit -1 SRR19160144_1.fastq.gz -2 SRR19160144_2.fastq.gz --out-dir megahit_SRR19160144 --num-cpu-threads 64
megahit -1 SRR19160145_1.fastq.gz -2 SRR19160145_2.fastq.gz --out-dir megahit_SRR19160145 --num-cpu-threads 64
megahit -1 SRR19160146_1.fastq.gz -2 SRR19160146_2.fastq.gz --out-dir megahit_SRR19160146 --num-cpu-threads 64
megahit -1 SRR19160147_1.fastq.gz -2 SRR19160147_2.fastq.gz --out-dir megahit_SRR19160147 --num-cpu-threads 64
megahit -1 SRR19160148_1.fastq.gz -2 SRR19160148_2.fastq.gz --out-dir megahit_SRR19160148 --num-cpu-threads 64
megahit -1 SRR19160149_1.fastq.gz -2 SRR19160149_2.fastq.gz --out-dir megahit_SRR19160149 --num-cpu-threads 64
megahit -1 SRR19160150_1.fastq.gz -2 SRR19160150_2.fastq.gz --out-dir megahit_SRR19160150 --num-cpu-threads 64
megahit -1 SRR19160151_1.fastq.gz -2 SRR19160151_2.fastq.gz --out-dir megahit_SRR19160151 --num-cpu-threads 64
megahit -1 SRR19160152_1.fastq.gz -2 SRR19160152_2.fastq.gz --out-dir megahit_SRR19160152 --num-cpu-threads 64
megahit -1 SRR19160153_1.fastq.gz -2 SRR19160153_2.fastq.gz --out-dir megahit_SRR19160153 --num-cpu-threads 64
megahit -1 SRR19160154_1.fastq.gz -2 SRR19160154_2.fastq.gz --out-dir megahit_SRR19160154 --num-cpu-threads 64
megahit -1 SRR19160155_1.fastq.gz -2 SRR19160155_2.fastq.gz --out-dir megahit_SRR19160155 --num-cpu-threads 64
megahit -1 SRR19160156_1.fastq.gz -2 SRR19160156_2.fastq.gz --out-dir megahit_SRR19160156 --num-cpu-threads 64
megahit -1 SRR19160157_1.fastq.gz -2 SRR19160157_2.fastq.gz --out-dir megahit_SRR19160157 --num-cpu-threads 64
megahit -1 SRR19160158_1.fastq.gz -2 SRR19160158_2.fastq.gz --out-dir megahit_SRR19160158 --num-cpu-threads 64
megahit -1 SRR19160159_1.fastq.gz -2 SRR19160159_2.fastq.gz --out-dir megahit_SRR19160159 --num-cpu-threads 64
megahit -1 SRR19160160_1.fastq.gz -2 SRR19160160_2.fastq.gz --out-dir megahit_SRR19160160 --num-cpu-threads 64
megahit -1 SRR19160161_1.fastq.gz -2 SRR19160161_2.fastq.gz --out-dir megahit_SRR19160161 --num-cpu-threads 64
megahit -1 SRR19160162_1.fastq.gz -2 SRR19160162_2.fastq.gz --out-dir megahit_SRR19160162 --num-cpu-threads 64
megahit -1 SRR19160163_1.fastq.gz -2 SRR19160163_2.fastq.gz --out-dir megahit_SRR19160163 --num-cpu-threads 64
megahit -1 SRR19160164_1.fastq.gz -2 SRR19160164_2.fastq.gz --out-dir megahit_SRR19160164 --num-cpu-threads 64
megahit -1 SRR19160165_1.fastq.gz -2 SRR19160165_2.fastq.gz --out-dir megahit_SRR19160165 --num-cpu-threads 64
megahit -1 SRR19160166_1.fastq.gz -2 SRR19160166_2.fastq.gz --out-dir megahit_SRR19160166 --num-cpu-threads 64
megahit -1 SRR19160167_1.fastq.gz -2 SRR19160167_2.fastq.gz --out-dir megahit_SRR19160167 --num-cpu-threads 64
megahit -1 SRR19160168_1.fastq.gz -2 SRR19160168_2.fastq.gz --out-dir megahit_SRR19160168 --num-cpu-threads 64
megahit -1 SRR19160169_1.fastq.gz -2 SRR19160169_2.fastq.gz --out-dir megahit_SRR19160169 --num-cpu-threads 64
megahit -1 SRR19160170_1.fastq.gz -2 SRR19160170_2.fastq.gz --out-dir megahit_SRR19160170 --num-cpu-threads 64
megahit -1 SRR19160171_1.fastq.gz -2 SRR19160171_2.fastq.gz --out-dir megahit_SRR19160171 --num-cpu-threads 64
megahit -1 SRR19160172_1.fastq.gz -2 SRR19160172_2.fastq.gz --out-dir megahit_SRR19160172 --num-cpu-threads 64
megahit -1 SRR19160173_1.fastq.gz -2 SRR19160173_2.fastq.gz --out-dir megahit_SRR19160173 --num-cpu-threads 64
megahit -1 SRR19160174_1.fastq.gz -2 SRR19160174_2.fastq.gz --out-dir megahit_SRR19160174 --num-cpu-threads 64
megahit -1 SRR19160175_1.fastq.gz -2 SRR19160175_2.fastq.gz --out-dir megahit_SRR19160175 --num-cpu-threads 64
megahit -1 SRR19160176_1.fastq.gz -2 SRR19160176_2.fastq.gz --out-dir megahit_SRR19160176 --num-cpu-threads 64
megahit -1 SRR19160177_1.fastq.gz -2 SRR19160177_2.fastq.gz --out-dir megahit_SRR19160177 --num-cpu-threads 64
megahit -1 SRR19160178_1.fastq.gz -2 SRR19160178_2.fastq.gz --out-dir megahit_SRR19160178 --num-cpu-threads 64
megahit -1 SRR19160179_1.fastq.gz -2 SRR19160179_2.fastq.gz --out-dir megahit_SRR19160179 --num-cpu-threads 64
megahit -1 SRR19160180_1.fastq.gz -2 SRR19160180_2.fastq.gz --out-dir megahit_SRR19160180 --num-cpu-threads 64
megahit -1 SRR19160181_1.fastq.gz -2 SRR19160181_2.fastq.gz --out-dir megahit_SRR19160181 --num-cpu-threads 64
megahit -1 SRR19160182_1.fastq.gz -2 SRR19160182_2.fastq.gz --out-dir megahit_SRR19160182 --num-cpu-threads 64
megahit -1 SRR19160183_1.fastq.gz -2 SRR19160183_2.fastq.gz --out-dir megahit_SRR19160183 --num-cpu-threads 64
megahit -1 SRR19160184_1.fastq.gz -2 SRR19160184_2.fastq.gz --out-dir megahit_SRR19160184 --num-cpu-threads 64
megahit -1 SRR19160185_1.fastq.gz -2 SRR19160185_2.fastq.gz --out-dir megahit_SRR19160185 --num-cpu-threads 64
megahit -1 SRR19160186_1.fastq.gz -2 SRR19160186_2.fastq.gz --out-dir megahit_SRR19160186 --num-cpu-threads 64
megahit -1 SRR19160187_1.fastq.gz -2 SRR19160187_2.fastq.gz --out-dir megahit_SRR19160187 --num-cpu-threads 64
megahit -1 SRR19160188_1.fastq.gz -2 SRR19160188_2.fastq.gz --out-dir megahit_SRR19160188 --num-cpu-threads 64
megahit -1 SRR19160189_1.fastq.gz -2 SRR19160189_2.fastq.gz --out-dir megahit_SRR19160189 --num-cpu-threads 64
megahit -1 SRR19160190_1.fastq.gz -2 SRR19160190_2.fastq.gz --out-dir megahit_SRR19160190 --num-cpu-threads 64
megahit -1 SRR19160191_1.fastq.gz -2 SRR19160191_2.fastq.gz --out-dir megahit_SRR19160191 --num-cpu-threads 64
megahit -1 SRR19160192_1.fastq.gz -2 SRR19160192_2.fastq.gz --out-dir megahit_SRR19160192 --num-cpu-threads 64
megahit -1 SRR19160193_1.fastq.gz -2 SRR19160193_2.fastq.gz --out-dir megahit_SRR19160193 --num-cpu-threads 64
megahit -1 SRR19160194_1.fastq.gz -2 SRR19160194_2.fastq.gz --out-dir megahit_SRR19160194 --num-cpu-threads 64
megahit -1 SRR19160195_1.fastq.gz -2 SRR19160195_2.fastq.gz --out-dir megahit_SRR19160195 --num-cpu-threads 64
megahit -1 SRR19160196_1.fastq.gz -2 SRR19160196_2.fastq.gz --out-dir megahit_SRR19160196 --num-cpu-threads 64
megahit -1 SRR19160197_1.fastq.gz -2 SRR19160197_2.fastq.gz --out-dir megahit_SRR19160197 --num-cpu-threads 64
megahit -1 SRR19160198_1.fastq.gz -2 SRR19160198_2.fastq.gz --out-dir megahit_SRR19160198 --num-cpu-threads 64
megahit -1 SRR19160199_1.fastq.gz -2 SRR19160199_2.fastq.gz --out-dir megahit_SRR19160199 --num-cpu-threads 64
megahit -1 SRR19160200_1.fastq.gz -2 SRR19160200_2.fastq.gz --out-dir megahit_SRR19160200 --num-cpu-threads 64
megahit -1 SRR19160201_1.fastq.gz -2 SRR19160201_2.fastq.gz --out-dir megahit_SRR19160201 --num-cpu-threads 64
megahit -1 SRR19160202_1.fastq.gz -2 SRR19160202_2.fastq.gz --out-dir megahit_SRR19160202 --num-cpu-threads 64
megahit -1 SRR19160203_1.fastq.gz -2 SRR19160203_2.fastq.gz --out-dir megahit_SRR19160203 --num-cpu-threads 64
megahit -1 SRR19160204_1.fastq.gz -2 SRR19160204_2.fastq.gz --out-dir megahit_SRR19160204 --num-cpu-threads 64
megahit -1 SRR19160205_1.fastq.gz -2 SRR19160205_2.fastq.gz --out-dir megahit_SRR19160205 --num-cpu-threads 64
megahit -1 SRR19160206_1.fastq.gz -2 SRR19160206_2.fastq.gz --out-dir megahit_SRR19160206 --num-cpu-threads 64
megahit -1 SRR19160207_1.fastq.gz -2 SRR19160207_2.fastq.gz --out-dir megahit_SRR19160207 --num-cpu-threads 64
megahit -1 SRR19160208_1.fastq.gz -2 SRR19160208_2.fastq.gz --out-dir megahit_SRR19160208 --num-cpu-threads 64
megahit -1 SRR19160209_1.fastq.gz -2 SRR19160209_2.fastq.gz --out-dir megahit_SRR19160209 --num-cpu-threads 64
megahit -1 SRR19160210_1.fastq.gz -2 SRR19160210_2.fastq.gz --out-dir megahit_SRR19160210 --num-cpu-threads 64
megahit -1 SRR19160211_1.fastq.gz -2 SRR19160211_2.fastq.gz --out-dir megahit_SRR19160211 --num-cpu-threads 64
megahit -1 SRR19160212_1.fastq.gz -2 SRR19160212_2.fastq.gz --out-dir megahit_SRR19160212 --num-cpu-threads 64
megahit -1 SRR19160213_1.fastq.gz -2 SRR19160213_2.fastq.gz --out-dir megahit_SRR19160213 --num-cpu-threads 64
megahit -1 SRR19160214_1.fastq.gz -2 SRR19160214_2.fastq.gz --out-dir megahit_SRR19160214 --num-cpu-threads 64
megahit -1 SRR19160215_1.fastq.gz -2 SRR19160215_2.fastq.gz --out-dir megahit_SRR19160215 --num-cpu-threads 64
megahit -1 SRR19160216_1.fastq.gz -2 SRR19160216_2.fastq.gz --out-dir megahit_SRR19160216 --num-cpu-threads 64
megahit -1 SRR19160217_1.fastq.gz -2 SRR19160217_2.fastq.gz --out-dir megahit_SRR19160217 --num-cpu-threads 64
megahit -1 SRR19160218_1.fastq.gz -2 SRR19160218_2.fastq.gz --out-dir megahit_SRR19160218 --num-cpu-threads 64
megahit -1 SRR19160219_1.fastq.gz -2 SRR19160219_2.fastq.gz --out-dir megahit_SRR19160219 --num-cpu-threads 64
megahit -1 SRR19160220_1.fastq.gz -2 SRR19160220_2.fastq.gz --out-dir megahit_SRR19160220 --num-cpu-threads 64
megahit -1 SRR19160221_1.fastq.gz -2 SRR19160221_2.fastq.gz --out-dir megahit_SRR19160221 --num-cpu-threads 64
megahit -1 SRR19160222_1.fastq.gz -2 SRR19160222_2.fastq.gz --out-dir megahit_SRR19160222 --num-cpu-threads 64
megahit -1 SRR19160223_1.fastq.gz -2 SRR19160223_2.fastq.gz --out-dir megahit_SRR19160223 --num-cpu-threads 64
megahit -1 SRR19160224_1.fastq.gz -2 SRR19160224_2.fastq.gz --out-dir megahit_SRR19160224 --num-cpu-threads 64
megahit -1 SRR19160225_1.fastq.gz -2 SRR19160225_2.fastq.gz --out-dir megahit_SRR19160225 --num-cpu-threads 64
megahit -1 SRR19160226_1.fastq.gz -2 SRR19160226_2.fastq.gz --out-dir megahit_SRR19160226 --num-cpu-threads 64
megahit -1 SRR19160227_1.fastq.gz -2 SRR19160227_2.fastq.gz --out-dir megahit_SRR19160227 --num-cpu-threads 64
megahit -1 SRR19160228_1.fastq.gz -2 SRR19160228_2.fastq.gz --out-dir megahit_SRR19160228 --num-cpu-threads 64
megahit -1 SRR19160229_1.fastq.gz -2 SRR19160229_2.fastq.gz --out-dir megahit_SRR19160229 --num-cpu-threads 64
megahit -1 SRR19160230_1.fastq.gz -2 SRR19160230_2.fastq.gz --out-dir megahit_SRR19160230 --num-cpu-threads 64
megahit -1 SRR19160231_1.fastq.gz -2 SRR19160231_2.fastq.gz --out-dir megahit_SRR19160231 --num-cpu-threads 64
megahit -1 SRR19160232_1.fastq.gz -2 SRR19160232_2.fastq.gz --out-dir megahit_SRR19160232 --num-cpu-threads 64
megahit -1 SRR19160233_1.fastq.gz -2 SRR19160233_2.fastq.gz --out-dir megahit_SRR19160233 --num-cpu-threads 64
megahit -1 SRR19160234_1.fastq.gz -2 SRR19160234_2.fastq.gz --out-dir megahit_SRR19160234 --num-cpu-threads 64
megahit -1 SRR19160235_1.fastq.gz -2 SRR19160235_2.fastq.gz --out-dir megahit_SRR19160235 --num-cpu-threads 64
megahit -1 SRR19160236_1.fastq.gz -2 SRR19160236_2.fastq.gz --out-dir megahit_SRR19160236 --num-cpu-threads 64
megahit -1 SRR19160237_1.fastq.gz -2 SRR19160237_2.fastq.gz --out-dir megahit_SRR19160237 --num-cpu-threads 64
megahit -1 SRR19160238_1.fastq.gz -2 SRR19160238_2.fastq.gz --out-dir megahit_SRR19160238 --num-cpu-threads 64
megahit -1 SRR19160239_1.fastq.gz -2 SRR19160239_2.fastq.gz --out-dir megahit_SRR19160239 --num-cpu-threads 64
megahit -1 SRR19160240_1.fastq.gz -2 SRR19160240_2.fastq.gz --out-dir megahit_SRR19160240 --num-cpu-threads 64
megahit -1 SRR19160241_1.fastq.gz -2 SRR19160241_2.fastq.gz --out-dir megahit_SRR19160241 --num-cpu-threads 64
megahit -1 SRR19160242_1.fastq.gz -2 SRR19160242_2.fastq.gz --out-dir megahit_SRR19160242 --num-cpu-threads 64
megahit -1 SRR19160243_1.fastq.gz -2 SRR19160243_2.fastq.gz --out-dir megahit_SRR19160243 --num-cpu-threads 64
megahit -1 SRR19160244_1.fastq.gz -2 SRR19160244_2.fastq.gz --out-dir megahit_SRR19160244 --num-cpu-threads 64
megahit -1 SRR19160245_1.fastq.gz -2 SRR19160245_2.fastq.gz --out-dir megahit_SRR19160245 --num-cpu-threads 64
megahit -1 SRR19160246_1.fastq.gz -2 SRR19160246_2.fastq.gz --out-dir megahit_SRR19160246 --num-cpu-threads 64
megahit -1 SRR19160247_1.fastq.gz -2 SRR19160247_2.fastq.gz --out-dir megahit_SRR19160247 --num-cpu-threads 64
megahit -1 SRR19160248_1.fastq.gz -2 SRR19160248_2.fastq.gz --out-dir megahit_SRR19160248 --num-cpu-threads 64
megahit -1 SRR19160249_1.fastq.gz -2 SRR19160249_2.fastq.gz --out-dir megahit_SRR19160249 --num-cpu-threads 64
megahit -1 SRR19160250_1.fastq.gz -2 SRR19160250_2.fastq.gz --out-dir megahit_SRR19160250 --num-cpu-threads 64
megahit -1 SRR19160251_1.fastq.gz -2 SRR19160251_2.fastq.gz --out-dir megahit_SRR19160251 --num-cpu-threads 64
megahit -1 SRR19160252_1.fastq.gz -2 SRR19160252_2.fastq.gz --out-dir megahit_SRR19160252 --num-cpu-threads 64
```

```
#eria's dataset
megahit -1 SRR6491182_1.fastq.gz -2 SRR6491182_2.fastq.gz --out-dir megahit_SRR6491182 --num-cpu-threads 64
megahit -1 SRR6491185_1.fastq.gz -2 SRR6491185_2.fastq.gz --out-dir megahit_SRR6491185 --num-cpu-threads 64
megahit -1 SRR6491183_1.fastq.gz -2 SRR6491183_2.fastq.gz --out-dir megahit_SRR6491183 --num-cpu-threads 64
megahit -1 SRR6491184_1.fastq.gz -2 SRR6491184_2.fastq.gz --out-dir megahit_SRR6491184 --num-cpu-threads 64
megahit -1 SRR6491180_1.fastq.gz -2 SRR6491180_2.fastq.gz --out-dir megahit_SRR6491180 --num-cpu-threads 64
megahit -1 SRR6491181_1.fastq.gz -2 SRR6491181_2.fastq.gz --out-dir megahit_SRR6491181 --num-cpu-threads 64
```

### Find genes with humann3
```
