import React from 'react'
import clsx from 'clsx'
import styles from './styles.module.css'

const FeatureList = [
  {
    title: '快速实现和部署测试业务',
    Svg: require('@site/static/img/undraw_handcrafts_to_do.svg').default,
    description: <></>,
  },
  {
    title: '全流程质量目标',
    Svg: require('@site/static/img/undraw_handcrafts_analytics.svg').default,
    description: <></>,
  },
  {
    title: '现代的可视化交互方式',
    Svg: require('@site/static/img/undraw_handcrafts_document.svg').default,
    description: <></>,
  },
]

function Feature({ Svg, title, description }) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" />
      </div>
      <div className="text--center padding-horiz--md">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  )
}

export default function HomepageFeatures() {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  )
}
